package com.hbj.niceprice.dao;

import com.hbj.niceprice.entity.GoodsInfo;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.source.RichSourceFunction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GoodsInfoSourceFromMysql extends RichSourceFunction<GoodsInfo> {
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/nice_price";
    String username = "root";
    String password = "huoshan";
    private Connection connection = null;
    private PreparedStatement ps = null;

    /**
     * open()方法中建立拦截，这样不用每次invoke的时候都需要建立连接和释放连接
     * org.apache.flink.api.common.functions.AbstractRichFunction#open
     */
    @Override
    public void open(Configuration parameters) throws Exception {
        super.open(parameters);
        connection = getConnection();
        String sql = "select * from nice_price.goods_info;";
        //获取执行语句
        ps = connection.prepareStatement(sql);
    }


    /**
     * DataStream 调用一次 run()方法执行查询并处理结果集
     * org.apache.flink.streaming.api.functions.source.SourceFunction#run
     */
    @Override
    public void run(SourceContext<GoodsInfo> ctx) throws Exception {
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            GoodsInfo goodsInfo = new GoodsInfo(
                    rs.getString("goods_id") + "aaaa",
                    rs.getString("goods_name"),
                    rs.getString("price"),
                    rs.getString("variety"),
                    rs.getString("detail"),
                    rs.getString("pic_address"),
                    rs.getString("link"),
                    rs.getString("plat_form"),
                    rs.getString("ave_comment")
            );
            ctx.collect(goodsInfo);//发送结果
        }
    }

    @Override
    public void cancel() {

    }

    /**
     * 关闭数据库连接
     * org.apache.flink.api.common.functions.AbstractRichFunction#close()
     */
    @Override
    public void close() throws Exception {
        super.close();
        if (connection != null) {
            connection.close();
        }
        if (ps != null) {
            ps.close();
        }
    }

    //获取mysql连接配置
    private Connection getConnection() {
        try {
            //加载驱动
            Class.forName(driver);
            //创建连接
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println("********mysql get connection occur exception, msg = " + e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }
}
