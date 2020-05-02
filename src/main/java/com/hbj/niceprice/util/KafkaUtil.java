package com.hbj.niceprice.util;

import com.alibaba.fastjson.JSON;
import com.hbj.niceprice.dao.TbDataCraw;
import com.hbj.niceprice.entity.GoodsInfo;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.util.List;
import java.util.Properties;

public class KafkaUtil implements Runnable {
    public static final String broker_list = "localhost:9092";
    private final String topic;  // kafka topic，Flink 程序中需要和这个统一
    private final KafkaProducer<String, String> producer;
    private Properties props;
    private TbDataCraw tbDataCraw = new TbDataCraw();
    private String keyword;

    public KafkaUtil(String topicName) {
        this.props = new Properties();
        props.put("bootstrap.servers", broker_list);
        props.put("key.serializer", StringSerializer.class.getName()); //key 序列化 "org.apache.kafka.common.serialization.StringSerializer"
        props.put("value.serializer", StringSerializer.class.getName()); //value 序列化
        this.producer = new KafkaProducer<String, String>(props);
        this.topic = topicName;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Properties getProps() {
        return props;
    }

    public String getTopic() {
        return topic;
    }

    @Override
    public void run() {
        List<GoodsInfo> goodsInfoList = tbDataCraw.soupTMALLGoodsListByKey(this.keyword);
        int i = 0;
        for (GoodsInfo g : goodsInfoList) {
            i++;
            System.out.println("序号-" + i + "  " + g.toString());
            ProducerRecord record = new ProducerRecord(topic, null, null, JSON.toJSONString(g));
            producer.send(record);
        }

//        for (int i = 0; i < 100; i++) {
//            GoodsInfo goodsInfo = new GoodsInfo("30087189311" + i,
//                    "Apple", "109", "影音视听,耳机,蓝牙耳机", "", "img.alicdn.com/bao/uploaded/i5/TB1ufQENa6qK1RjSZFmbLB0PFXa_054539.jpg\t",
//                    "detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.1e7834416hztr8&id=589880871893&skuId=4200907042830&areaId=310100&standard=1&user_id=2616970884&cat_id=2&is_b=1&rn=aef77bf33ae9b3eb8504efb7706431c4",
//                    "Tmall", "0", "");
//            ProducerRecord record = new ProducerRecord<String, String>(topic, null, null, JSON.toJSONString(goodsInfo));
//            producer.send(record);
//            System.out.println("发送数据: " + JSON.toJSONString(goodsInfo));
//        }
        producer.flush();
    }

    public static void main(String[] args) {
        KafkaUtil kafkaUtil = new KafkaUtil("test");
        Thread thread = new Thread(kafkaUtil);
        thread.start();
    }
}
