package com.hbj.niceprice.util;

import com.alibaba.fastjson.JSON;
import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.entity.Metric;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class KafkaUtil {
    public static final String broker_list = "localhost:9092";
    public static final String topic = "GoodsInfo";  // kafka topic，Flink 程序中需要和这个统一

    public static void writeToKafka() throws InterruptedException {
        Properties props = new Properties();
        props.put("bootstrap.servers", broker_list);
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer"); //key 序列化
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer"); //value 序列化
        KafkaProducer producer = new KafkaProducer<String, String>(props);
//        Metric metric = new Metric();
//        metric.setTimestamp(System.currentTimeMillis());
//        metric.setName("mem");
//        Map<String, String> tags = new HashMap<>();
//        Map<String, Object> fields = new HashMap<>();
//
//        tags.put("cluster", "zhisheng");
//        tags.put("host_ip", "101.147.022.106");
//
//        fields.put("used_percent", 90d);
//        fields.put("max", 27244873d);
//        fields.put("used", 17244873d);
//        fields.put("init", 27244873d);
//
//        metric.setTags(tags);
//        metric.setFields(fields);

        for (int i = 0; i < 100; i++) {
            GoodsInfo goodsInfo = new GoodsInfo("58988087189311" + i,
                    "Apple", "109", "影音视听,耳机,蓝牙耳机", "", "img.alicdn.com/bao/uploaded/i5/TB1ufQENa6qK1RjSZFmbLB0PFXa_054539.jpg\t",
                    "detail.tmall.com/item.htm?spm=a220m.1000858.1000725.2.1e7834416hztr8&id=589880871893&skuId=4200907042830&areaId=310100&standard=1&user_id=2616970884&cat_id=2&is_b=1&rn=aef77bf33ae9b3eb8504efb7706431c4",
                    "Tmall", "0");
            ProducerRecord record = new ProducerRecord<String, String>(topic, null, null, JSON.toJSONString(goodsInfo));
            producer.send(record);
            System.out.println("发送数据: " + JSON.toJSONString(goodsInfo));
        }
        producer.flush();
    }

    public static void main(String[] args) throws InterruptedException {
        writeToKafka();
    }
}
