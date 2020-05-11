package com.hbj.niceprice.service.priceSave;

import com.hbj.niceprice.util.KafkaUtil;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;

import java.util.Properties;

public class PriceSaveKafka2FlinkService implements Runnable {
    final StreamExecutionEnvironment env =
            StreamExecutionEnvironment.getExecutionEnvironment();
    KafkaUtil kafkaUtil;
    Properties prop;
    String topicName;

    public PriceSaveKafka2FlinkService(String topicName) {
        this.kafkaUtil = new KafkaUtil(topicName);
        this.prop = kafkaUtil.getProps();
        this.topicName = kafkaUtil.getTopic();
    }

    public KafkaUtil getKafkaUtil() {
        return kafkaUtil;
    }

    @Override
    public void run() {

    }
}
