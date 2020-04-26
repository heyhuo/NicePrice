package com.hbj.niceprice.util;


import org.apache.flink.api.java.tuple.Tuple9;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class Flink2JDBCWriter extends RichSinkFunction<Tuple9<String, String, String,
        String, String, String, String, String, String>> {
    private Connection con = null;
    private PreparedStatement ps = null;

    @Override
    public void open(Configuration parameters) throws Exception {
        super.open(parameters);
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "huoshan");
        ps = con.prepareStatement("insert into goods_info values (?,?,?,?,?,?,?,?,?)");
    }

    @Override
    public void invoke(Tuple9<String, String, String, String, String, String, String,
            String, String> value, Context context) throws Exception {
        ps.setString(1, value.f0);
        ps.setString(2, value.f1);
        ps.setString(3, value.f2);
        ps.setString(4, value.f3);
        ps.setString(5, value.f4);
        ps.setString(6, value.f5);
        ps.setString(7, value.f6);
        ps.setString(8, value.f7);
        ps.setString(9, value.f8);
        ps.executeUpdate();
    }

    @Override
    public void close() throws Exception {
        try {
            super.close();
            if (con != null) {
                con.close();
            }
            if (ps != null) {
                ps.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
