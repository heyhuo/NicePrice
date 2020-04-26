package com.hbj.niceprice.util;


public class UrlData {
    private int status;
    private String platform;
    private Long number;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public String getPlatform() {
        return platform;
    }

    public Long getNumber() {
        return number;
    }



    @Override
    public String toString() {
        return "UrlData{" +
                "status=" + status +
                ", platform='" + platform + '\'' +
                ", number=" + number +
                '}';
    }


}



