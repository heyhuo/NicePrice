package com.hbj.niceprice.util;

import org.apache.kafka.clients.producer.KafkaProducer;

import java.util.Properties;

public class KafkaUtil {
    public static final String broker_list = "localhost:9092";
    public final String topic;  // kafka topic，Flink 程序中需要和这个统一
    public final KafkaProducer<String, String> producer;
    private Properties props;

    public KafkaUtil(String topicName) {
        this.props = new Properties();
        props.put("bootstrap.servers", broker_list);
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer"); //key 序列化 "org.apache.kafka.common.serialization.StringSerializer"
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer"); //value 序列化
        this.producer = new KafkaProducer<String, String>(props);
        this.topic = topicName;
    }

    public Properties getProps() {
        return props;
    }

    public String getTopic() {
        return topic;
    }

}
