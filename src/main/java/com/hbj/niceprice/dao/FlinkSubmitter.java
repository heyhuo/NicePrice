package com.hbj.niceprice.dao;

import com.hbj.niceprice.entity.GoodsInfo;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;

public class FlinkSubmitter {
    public static void main(String[] args) throws Exception {

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        DataStreamSource<GoodsInfo> record = env.addSource(new GoodsInfoSourceFromMysql());
        //对于record可以添加一些处理逻辑
        record.print().setParallelism(1);
        env.execute("Flink Mysql Source");

    }
}
