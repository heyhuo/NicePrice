package com.hbj.niceprice.dao;

import com.alibaba.fastjson.JSON;
import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.util.GoodsInfoSinkToMysql;
import com.hbj.niceprice.util.GoodsInfoSourceFromMysql;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaProducer011;

import java.util.Properties;

public class FlinkSubmitter {
    public static void main(String[] args) throws Exception {

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        Properties props = new Properties();
        props.put("bootstrap.servers", "localhost:9092");
        props.put("zookeeper.connect", "localhost:2181");
        props.put("group.id", "metric-group");
        props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        props.put("auto.offset.reset", "latest");

//        DataStreamSource<GoodsInfo> record = env.addSource(new GoodsInfoSourceFromMysql());

        //Fastjson 解析字符串成 student 对象
        SingleOutputStreamOperator<GoodsInfo> goodsInfo = env.addSource(new FlinkKafkaConsumer<>(
                "GoodsInfo",   //这个 kafka topic 需要和上面的工具类的 topic 一致
                new SimpleStringSchema(),
                props)).setParallelism(1)
                .map(string -> JSON.parseObject(string, GoodsInfo.class));

        //对于record可以添加一些处理逻辑
        goodsInfo.addSink(new GoodsInfoSinkToMysql());
        goodsInfo.print().setParallelism(1);
        env.execute("Flink Mysql Source");

    }
}
