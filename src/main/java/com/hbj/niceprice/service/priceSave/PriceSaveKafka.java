package com.hbj.niceprice.service.priceSave;

import com.hbj.niceprice.util.KafkaUtil;
import com.hbj.niceprice.util.TbDataCraw;

import java.util.List;

public class PriceSaveKafka implements Runnable {

    private List<String> goodId;
    private List<String> goodsName;
    private KafkaUtil kafkaUtil;
    private TbDataCraw tbDataCraw = new TbDataCraw();

    public List<String> getGoodId() {
        return goodId;
    }

    public void setGoodId(List<String> goodId) {
        this.goodId = goodId;
    }

    public List<String> getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(List<String> goodsName) {
        this.goodsName = goodsName;
    }

    public KafkaUtil getKafkaUtil() {
        return kafkaUtil;
    }

    public void setKafkaUtil(KafkaUtil kafkaUtil) {
        this.kafkaUtil = kafkaUtil;
    }

    public PriceSaveKafka(List<String> goodId, List<String> goodsName, KafkaUtil kafkaUtil) {
        this.goodId = goodId;
        this.goodsName = goodsName;
        this.kafkaUtil = kafkaUtil;
    }


    @Override
    public void run() {
        for (String name : goodsName) {

        }
    }
}
