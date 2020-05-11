package com.hbj.niceprice.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class PriceSave {

    public String goodsId;
    public String platForm;
    public String priceTime;
    public int price;
    SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");

    public PriceSave() {
    }

    public PriceSave(String goodsId, String priceTime, int price) {
        this.goodsId = goodsId;
        this.priceTime = ft.format(new Date());
        this.price = price;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getPlatForm() {
        return platForm;
    }

    public void setPlatForm(String platForm) {
        this.platForm = platForm;
    }

    public String getPriceTime() {
        return priceTime;
    }

    public void setPriceTime(String priceTime) {
        this.priceTime = priceTime;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "PriceSave{" +
                "goodsId='" + goodsId + '\'' +
                ", platForm='" + platForm + '\'' +
                ", priceTime='" + priceTime + '\'' +
                ", price='" + price + '\'' +
                '}';
    }
}
