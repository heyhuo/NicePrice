package com.hbj.niceprice.entity;

public class UserInfo {

    public int userId;
    public String userCount;
    public String userPwd;

    public int getUserId() {
        return userId;
    }


    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserCount() {
        return userCount;
    }

    public void setUserCount(String userCount) {
        this.userCount = userCount;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId=" + userId +
                ", userCount='" + userCount + '\'' +
                ", userPwd='" + userPwd + '\'' +
                '}';
    }
}
