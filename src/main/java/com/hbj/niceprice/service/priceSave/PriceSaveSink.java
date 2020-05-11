package com.hbj.niceprice.service.priceSave;

import com.hbj.niceprice.entity.PriceSave;
import com.hbj.niceprice.util.FlinkConnection;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class PriceSaveSink extends RichSinkFunction<PriceSave> {

    PreparedStatement ps;
    private Connection connection;

    @Override
    public void open(Configuration parameters) throws Exception {
        super.open(parameters);
        connection = FlinkConnection.getConnection();
        String sql = "INSERT INTO price_save(goods_id,price_time,price)" +
                "VALUES(?,?,?)";
        ps = this.connection.prepareStatement(sql);
    }

    @Override
    public void invoke(PriceSave value, Context context) throws Exception {
        ps.setString(1, value.getGoodsId());
        ps.setTimestamp(2, Timestamp.valueOf(value.getPriceTime()));
        ps.setInt(3, value.getPrice());
        ps.executeUpdate();
    }

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
}
