package com.hbj.niceprice.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class FlinkConnection {
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/nice_price?useUnicode=true&characterEncoding=UTF-8", "root", "88888888");
        } catch (Exception e) {
            System.out.println("-----------mysql get connection has exception , msg = " + e.getMessage());
        }
        return connection;
    }
}
