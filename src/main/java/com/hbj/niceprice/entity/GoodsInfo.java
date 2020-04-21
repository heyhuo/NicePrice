package com.hbj.niceprice.entity;

public class GoodsInfo {
    public String GoodsId;
    public String GoodsName;
    public String price;
    public String variety;
    public String detail;
    public String picAddress;
    public String link;
    public String platForm;
    public String aveComment;

    public String getGoodsId() {
        return GoodsId;
    }

    public void setGoodsId(String goodsId) {
        GoodsId = goodsId;
    }

    public String getGoodsName() {
        return GoodsName;
    }

    public void setGoodsName(String goodsName) {
        GoodsName = goodsName;
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

    @Override
    public String toString() {
        return "GoodsInfo{" +
                "GoodsId='" + GoodsId + '\'' +
                ", GoodsName='" + GoodsName + '\'' +
                ", price='" + price + '\'' +
                ", variety='" + variety + '\'' +
                ", detail='" + detail + '\'' +
                ", picAddress='" + picAddress + '\'' +
                ", link='" + link + '\'' +
                ", platForm='" + platForm + '\'' +
                ", aveComment='" + aveComment + '\'' +
                '}';
    }
}
