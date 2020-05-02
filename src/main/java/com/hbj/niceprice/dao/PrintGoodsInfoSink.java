package com.hbj.niceprice.dao;

import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;

public class PrintGoodsInfoSink<String> extends RichSinkFunction<String> {
    public PrintGoodsInfoSink() {
    }

    @Override
    public void invoke(String value) throws Exception {

    }
}
