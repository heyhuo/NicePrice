package com.hbj.niceprice.mapper;

import com.hbj.niceprice.entity.GoodsInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface GoodsInfoMapper {
    GoodsInfo findById(String Id);

    void insert(GoodsInfo goodsInfo);

    List<GoodsInfo> selectAll();
}
