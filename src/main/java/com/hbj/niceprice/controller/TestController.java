package com.hbj.niceprice.controller;

import com.huibijia.demo.dao.UrlDataDao;
import com.huibijia.demo.entity.Product;
import com.huibijia.demo.entity.UrlData;

import java.util.List;

import static com.huibijia.demo.dao.UrlDataDao.soupTmallDetailById;
import static com.huibijia.demo.dao.UrlUtils.analyseUrl;

public class TestController {
    public static void main(String[] args) {

        String tmallUrl = "https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.8.27832a99AfoD5W&id=604433373792&skuId=4233630160968&user_id=1776477331&cat_id=2&is_b=1&rn=2eff85a6a504024ee62222a0045d9ded";
        UrlData tmall = analyseUrl(tmallUrl);

//        通过网站链接查看历史价格
        Product p = (Product) soupTmallDetailById(tmall.getNumber());

//        通过关键字搜索商品信息
        List<Product> pList = UrlDataDao.soupTaobaoByKeyWord("airpods2");
    }
}
