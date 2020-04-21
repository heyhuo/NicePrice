package com.hbj.niceprice.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.sql.Timestamp;


public class Product implements Serializable {
    private Long id;


    /*电商商品id*/
    private Long number;

    private Float price;

    private Integer userId;

    private String url;
    /*电商平台*/
    private Integer platformId;
    //商品标题
    private String title;
    //商品详情
    private String describe;
    //商品状态（是否存在）
    private Integer status;

    public Long getId() {
        return id;
    }

    public Long getNumber() {
        return number;
    }

    public Float getPrice() {
        return price;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getUrl() {
        return url;
    }

    public Integer getPlatformId() {
        return platformId;
    }

    public String getTitle() {
        return title;
    }

    public String getDescribe() {
        return describe;
    }

    public Integer getStatus() {
        return status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setPlatformId(Integer platformId) {
        this.platformId = platformId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", number=" + number +
                ", price=" + price +
                ", userId=" + userId +
                ", url='" + url + '\'' +
                ", platformId=" + platformId +
                ", title='" + title + '\'' +
                ", describe='" + describe + '\'' +
                ", status=" + status +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp createdAt;

    private Timestamp updatedAt;

}
