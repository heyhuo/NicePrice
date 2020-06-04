package com.hbj.niceprice.service.priceSave;

import com.alibaba.fastjson.JSON;
import com.hbj.niceprice.entity.PriceSave;
import com.hbj.niceprice.util.KafkaUtil;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;

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
        SingleOutputStreamOperator<PriceSave> priceSave = env.addSource(new FlinkKafkaConsumer<>(
                this.topicName,
                new SimpleStringSchema(),
                this.prop)).setParallelism(1)
                .map(string -> JSON.parseObject(string, PriceSave.class));
        priceSave.addSink(new PriceSaveSink());
        priceSave.print().setParallelism(1);
        try {
            env.execute("Flink Mysql Source->" + topicName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
