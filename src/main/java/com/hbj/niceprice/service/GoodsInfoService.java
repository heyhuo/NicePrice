package com.hbj.niceprice.service;

import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.mapper.GoodsInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsInfoService")
public class GoodsInfoService {

    @Autowired
    public GoodsInfoMapper goodsInfoMapper;

    public List<GoodsInfo> selectAll() {
        return goodsInfoMapper.selectAll();
    }

    public GoodsInfo findById(String id) {
        return goodsInfoMapper.findById(id);
    }

    public List<GoodsInfo> selectByVariety(String variety, Integer page, Integer size) {
        return goodsInfoMapper.selectByVariety(variety, page, size);
    }

    public List<GoodsInfo> getListByVariety(String variety) {
        return goodsInfoMapper.getListByVariety(variety);
    }

}