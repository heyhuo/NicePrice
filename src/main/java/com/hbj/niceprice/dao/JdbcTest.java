package com.hbj.niceprice.dao;

import com.sun.xml.internal.bind.v2.bytecode.ClassTailor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcTest {
    public static void main(String[] args) throws Exception {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/nice_price";
        String username = "root";
        String password = "huoshan";
        Connection connection = null;
        Statement statement = null;

        try {
            //加载驱动
            Class.forName(driver);
            //创建连接
            connection = DriverManager.getConnection(url, username, password);
            //获取执行语句
            statement = connection.createStatement();
            //执行查询，获得结果集
            ResultSet resultSet = statement.executeQuery("SELECT * FROM goods_info;");

            //处理结果集
            while (resultSet.next()) {
                String goodsName = resultSet.getString("goods_name");
                String price = resultSet.getString("price");
                System.out.println(goodsName + "\n" + price);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭资源，释放资源
            if (connection != null)
                connection.close();
            if (statement != null)
                statement.close();
        }


    }
}
