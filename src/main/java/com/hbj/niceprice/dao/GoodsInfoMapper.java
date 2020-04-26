package com.hbj.niceprice.dao;

import com.hbj.niceprice.entity.GoodsInfo;

public interface GoodsInfoMapper {
    public GoodsInfo findById(Long Id);

    public void insert(GoodsInfo goodsInfo);
}
