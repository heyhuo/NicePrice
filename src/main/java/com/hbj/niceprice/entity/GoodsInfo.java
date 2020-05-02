package com.hbj.niceprice.entity;

import org.apache.flink.streaming.api.functions.source.SourceFunction;

public class GoodsInfo {
    public String goodsId;
    public String goodsName;
    public String price;
    public String variety;
    public String detail;
    public String picAddress;
    public String link;
    public String platForm;
    public String aveComment;
    public String tag;


    public GoodsInfo() {
    }

    public GoodsInfo(String goodsId, String goodsName, String price, String variety, String tag, String detail,
                     String picAddress, String link, String platForm, String aveComment) {
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.price = price;
        this.variety = variety;
        this.tag = tag;
        this.detail = detail;
        this.picAddress = picAddress;
        this.link = link;
        this.platForm = platForm;
        this.aveComment = aveComment;

    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getVariety() {
        return variety;
    }

    public void setVariety(String variety) {
        this.variety = variety;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getPicAddress() {
        return picAddress;
    }

    public void setPicAddress(String picAddress) {
        this.picAddress = picAddress;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getPlatForm() {
        return platForm;
    }

    public void setPlatForm(String platForm) {
        this.platForm = platForm;
    }

    public String getAveComment() {
        return aveComment;
    }

    public void setAveComment(String aveComment) {
        this.aveComment = aveComment;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "GoodsInfo{" +
                "goodsId='" + goodsId + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", price='" + price + '\'' +
                ", variety='" + variety + '\'' +
                ", tag='" + tag + '\'' +
                ", detail='" + detail + '\'' +
                ", picAddress='" + picAddress + '\'' +
                ", link='" + link + '\'' +
                ", platForm='" + platForm + '\'' +
                ", aveComment='" + aveComment + '\'' +
                '}';
    }
}
