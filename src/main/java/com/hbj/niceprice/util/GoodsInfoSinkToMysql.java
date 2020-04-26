package com.hbj.niceprice.util;

import com.hbj.niceprice.dao.GoodsInfoDao;
import com.hbj.niceprice.dao.GoodsInfoMapper;
import com.hbj.niceprice.entity.GoodsInfo;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class GoodsInfoSinkToMysql extends RichSinkFunction<GoodsInfo> {

    PreparedStatement ps;
    private Connection connection;
    private GoodsInfoMapper goodsInfoMapper;

    /**
     * open() 方法中建立连接，这样不用每次 invoke 的时候都要建立连接和释放连接
     *
     * @param parameters
     * @throws Exception
     */
    @Override
    public void open(Configuration parameters) throws Exception {
        super.open(parameters);
        connection = getConnection();
        String sql = "insert into goods_info(goods_id, goods_name, price, variety,detail,pic_address,link,plat_form) values(?, ?, ?, ?,?, ?, ?, ?);";
        ps = this.connection.prepareStatement(sql);
//        try {
//            goodsInfoMapper = GoodsInfoDao.getInstance();
//        } catch (Exception e) {
//            System.out.println(e);
//        }

    }

    /**
     * 每条数据的插入都要调用一次 invoke() 方法
     *
     * @param value
     * @param context
     * @throws Exception
     */
    @Override
    public void invoke(GoodsInfo value, Context context) throws Exception {
        //组装数据，执行插入操作
        ps.setString(1, value.getGoodsId());
        ps.setString(2, value.getGoodsName());
        ps.setString(3, value.getPrice());
        ps.setString(4, value.getVariety());
        ps.setString(5, value.getDetail());
        ps.setString(6, value.getPicAddress());
        ps.setString(7, value.getLink());
        ps.setString(8, value.getPlatForm());
        ps.executeUpdate();
//        GoodsInfo goodsInfo = new GoodsInfo(value.getGoodsId(),
//                value.getGoodsName(), value.getPrice(), value.getPrice(),
//                value.getPrice(), value.getPrice(), value.getPrice(),
//                value.getPrice());
//        try {
//            goodsInfoMapper.insert(value);
//        } catch (Exception e) {
//            System.out.println(e);
//        }
    }

    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/nice_price?useUnicode=true&characterEncoding=UTF-8", "root", "huoshan");
        } catch (Exception e) {
            System.out.println("-----------mysql get connection has exception , msg = " + e.getMessage());
        }
        return connection;
    }

    @Override
    public void close() throws Exception {
        super.close();
        //关闭连接和释放资源
        if (connection != null) {
            connection.close();
        }
        if (ps != null) {
            ps.close();
        }
    }

}