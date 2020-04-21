package com.hbj.niceprice.entity;

public class Comments {
    public int userId;
    public String goodsId;
    public String gradeComment;


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGradeComment() {
        return gradeComment;
    }

    public void setGradeComment(String gradeComment) {
        this.gradeComment = gradeComment;
    }

    @Override
    public String toString() {
        return "Comments{" +
                "userId=" + userId +
                ", goodsId='" + goodsId + '\'' +
                ", gradeComment='" + gradeComment + '\'' +
                '}';
    }
}
