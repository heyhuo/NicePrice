package com.hbj.niceprice.service.goodsInfo;

import com.hbj.niceprice.entity.GoodsInfo;

import com.hbj.niceprice.util.FlinkConnection;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class GoodsInfoSink extends RichSinkFunction<GoodsInfo> {

    PreparedStatement ps;
    private Connection connection;

    /**
     * open() 方法中建立连接，这样不用每次 invoke 的时候都要建立连接和释放连接
     *
     * @param parameters
     * @throws Exception
     */
    @Override
    public void open(Configuration parameters) throws Exception {
        super.open(parameters);
        connection = FlinkConnection.getConnection();
        String sql = "INSERT INTO goods_info(goods_id, goods_name, price, variety,tag," +
                "detail,pic_address,link,plat_form,craw_date,month_sale,comment_num) " +
                "VALUES (?, ?, ?,?, ?,?, ?, ?,?, ?, ?,?) ON DUPLICATE KEY UPDATE craw_date=?;";
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
        ps.setString(5, value.getTag());
        ps.setString(6, value.getDetail());
        ps.setString(7, value.getPicAddress());
        ps.setString(8, value.getLink());
        ps.setString(9, value.getPlatForm());
        ps.setString(10, value.getCrawDate());
        ps.setInt(11, value.getMonthSale());
        ps.setInt(12, value.getCommentNum());
        ps.setString(13, value.getCrawDate());
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
