package com.hbj.niceprice.util;

import org.apache.flink.api.java.tuple.Tuple10;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.source.RichSourceFunction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Flink2JDBCReader extends RichSourceFunction<Tuple10<String, String, String,
        String, String, String, String, String, String, String>> {

    private static final long sirealVersion = 3334654984018091675L;
    private Connection connect = null;
    private PreparedStatement ps = null;

    @Override
    public void open(Configuration parameters) throws Exception {
        super.open(parameters);
        Class.forName("com.mysql.jdbc.Driver");
        connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "huoshan");
        ps = (PreparedStatement) connect
                .prepareStatement("select col1,col2,col3,col4,col5,col6,col7,col8,col9,col10 from flink.test_tb");
    }

    @Override
    public void run(SourceContext ctx) throws Exception {

    }

    @Override
    public void cancel() {

    }
}
