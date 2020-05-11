package com.hbj.niceprice.service;

import com.alibaba.fastjson.JSON;
import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.util.GoodsInfoSink;
import com.hbj.niceprice.util.KafkaUtil;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;

import java.util.Properties;

public class Flink2GoodsInfoService implements Runnable {
    final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
    KafkaUtil kafkaUtil;
    Properties prop;
    String topicName;

    public Flink2GoodsInfoService(String topicName) {
        this.kafkaUtil = new KafkaUtil(topicName);
        this.prop = kafkaUtil.getProps();
        this.topicName = kafkaUtil.getTopic();
    }


    public KafkaUtil getKafkaUtil() {
        return kafkaUtil;
    }

    @Override
    public void run() {
        SingleOutputStreamOperator<GoodsInfo> goodsInfo = env.addSource(new FlinkKafkaConsumer<>(
                this.topicName,   //这个 kafka topic 需要和上面的工具类的 topic 一致
                new SimpleStringSchema(),
                this.prop)).setParallelism(1)
                .map(string -> JSON.parseObject(string, GoodsInfo.class));
        //对于record可以添加一些处理逻辑
        goodsInfo.addSink(new GoodsInfoSink());
        goodsInfo.print().setParallelism(1);
        try {
            env.execute("Flink Mysql Source->" + this.topicName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
