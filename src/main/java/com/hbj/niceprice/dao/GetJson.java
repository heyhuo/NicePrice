package com.hbj.niceprice.dao;

import com.alibaba.fastjson.JSONObject;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class GetJson {
    public JSONObject getHttpJson(String url, int comefrom) {
        try {
            URL realUrl = new URL(url);
            URLConnection connection = realUrl.openConnection();
            connection.setRequestProperty("authority", "s.taobao.com");
            connection.setRequestProperty("pragma", "no-cache");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
