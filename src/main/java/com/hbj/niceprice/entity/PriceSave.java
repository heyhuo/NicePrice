package com.hbj.niceprice.entity;

public class PriceSave {

    public String goodsId;
    public String platForm;
    public String priceTime;
    public String price;


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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
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
