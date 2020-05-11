package com.hbj.niceprice.mapper;

import com.hbj.niceprice.entity.GoodsInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface GoodsInfoMapper {
    GoodsInfo findById(String goodsId);

    void insert(GoodsInfo goodsInfo);

    List<GoodsInfo> selectAll();

    List<GoodsInfo> selectByVariety(String variety, Integer page, Integer size);

    List<GoodsInfo> getListByVariety(String variety);

    void updateGoodsDetailById(String goodsId, String detail);

    List<?> selectPriceById(String goodsId);

    List<GoodsInfo> searchGoodsByGoodsName(String goodsName);
}
