package com.hbj.niceprice.util;

import com.alibaba.fastjson.JSON;
import com.hbj.niceprice.dao.TbDataCraw;
import com.hbj.niceprice.entity.GoodsInfo;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
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
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer"); //key 序列化 "org.apache.kafka.common.serialization.StringSerializer"
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer"); //value 序列化
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
        List<String> list = readKeywordBytxt("/Users/xwj/IdeaProjects/NicePrice/src/main/resources/data/keyword.txt");
        for (String keyword : list) {
            keyword = keyword.split("_")[0];
            System.out.println("------------" + keyword + "-----------");
            List<GoodsInfo> goodsInfoList = tbDataCraw.soupTMALLGoodsListByKey(keyword);
            int i = 0;
            for (GoodsInfo g : goodsInfoList) {
                i++;
                System.out.println("序号-" + i + "  " + g.toString());
                ProducerRecord record = new ProducerRecord(topic, null, null, JSON.toJSONString(g));
                producer.send(record);
            }
            producer.flush();
        }

    }

    public static List<String> readKeywordBytxt(String pathname) {
        List<String> list = new ArrayList<>();
        try {
            FileReader reader = new FileReader(pathname);
            BufferedReader br = new BufferedReader(reader);
            String line;
            //网友推荐更加简洁的写法
            while ((line = br.readLine()) != null) {
                list.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        KafkaUtil kafkaUtil = new KafkaUtil("test");
        Thread thread = new Thread(kafkaUtil);
        thread.start();
    }
}
