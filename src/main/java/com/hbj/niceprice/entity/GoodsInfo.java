package com.hbj.niceprice.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GoodsInfo {
    private String goodsId;
    private String goodsName;
    private String price;
    private String variety;
    private int monthSale;
    private int commentNum;
    private String detail;
    private String picAddress;
    private String link;
    private String platForm;
    private String aveComment;
    private String tag;
    private String crawDate;
    SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    public GoodsInfo() {
    }

    public GoodsInfo(String goodsId, String goodsName, String price, String variety, String tag, String detail,
                     String picAddress, String link, String platForm, String aveComment, int monthSale, int commentNum) {
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
        this.commentNum = commentNum;
        this.monthSale = monthSale;

        this.crawDate = ft.format(new Date());
    }


    public int getMonthSale() {
        return monthSale;
    }

    public void setMonthSale(int monthSale) {
        this.monthSale = monthSale;
    }

    public int getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }

    public String getCrawDate() {
        return crawDate;
    }

    public void setCrawDate(String crawDate) {
        this.crawDate = crawDate;
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

    public GoodsInfo(String goodsId, String goodsName, String price, String variety, int monthSale, int commentNum, String detail, String picAddress, String link, String platForm, String aveComment, String tag, String crawDate, SimpleDateFormat ft) {
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.price = price;
        this.variety = variety;
        this.monthSale = monthSale;
        this.commentNum = commentNum;
        this.detail = detail;
        this.picAddress = picAddress;
        this.link = link;
        this.platForm = platForm;
        this.aveComment = aveComment;
        this.tag = tag;
        this.crawDate = crawDate;
        this.ft = ft;
    }

    @Override
    public String toString() {
        return "GoodsInfo{" +
                "goodsId='" + goodsId + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", price='" + price + '\'' +
                ", variety='" + variety + '\'' +
                ", monthSale='" + monthSale + '\'' +
                ", commentNum='" + commentNum + '\'' +
                ", detail='" + detail + '\'' +
                ", picAddress='" + picAddress + '\'' +
                ", link='" + link + '\'' +
                ", platForm='" + platForm + '\'' +
                ", aveComment='" + aveComment + '\'' +
                ", tag='" + tag + '\'' +
                ", crawDate='" + crawDate + '\'' +
                ", ft=" + ft +
                '}';
    }
}
