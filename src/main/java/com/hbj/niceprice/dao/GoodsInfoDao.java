package com.hbj.niceprice.dao;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GoodsInfoDao {

    private volatile static GoodsInfoMapper goodsInfoMapper;
    //按关键字查询的商品-flink-sink-into-mysql

    public GoodsInfoDao() {
    }

    public static GoodsInfoMapper getInstance() {
        if (goodsInfoMapper == null) {
            synchronized (GoodsInfoDao.class) {
                if (goodsInfoMapper == null) {
                    ApplicationContext ctx = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
                    goodsInfoMapper = ctx.getBean(GoodsInfoMapper.class);
                }
            }
        }
        return goodsInfoMapper;
    }
}
