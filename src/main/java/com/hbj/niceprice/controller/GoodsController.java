package com.hbj.niceprice.controller;

import com.hbj.niceprice.dao.TbDataCraw;
import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.service.Flink2GoodsInfoService;
import com.hbj.niceprice.service.GoodsInfoService;
import com.hbj.niceprice.util.Catalogs;
import com.hbj.niceprice.util.KafkaUtil;
import com.hbj.niceprice.util.UrlConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@RestController
@RequestMapping("/hbj")
public class GoodsController {

    @Autowired
    private GoodsInfoService goodsInfoService;


    @ResponseBody
    @RequestMapping("/getGoodsList")
    public Map<String, Object> getGoodsList() {
        Map<String, Object> rs = new HashMap<>();
//        List<String> key = KafkaUtil.readKeywordBytxt("src/main/resources/data/keyword.txt");
//        List<GoodsInfo> list = goodsInfoService.selectAll();
        for (Catalogs catalogs : Catalogs.values()) {
            String[] keyword = catalogs.toString().split("_");
            List<GoodsInfo> list = goodsInfoService.selectByVariety(keyword[0] + "%", 0, 8);
            rs.put(keyword[1], list);
        }
        return rs;
    }

    @ResponseBody
    @RequestMapping(value = "/getListByVariety", method = POST)
    public List<?> getListByVariety(String variety) {

        return goodsInfoService.getListByVariety(variety);
    }

    @ResponseBody
    @RequestMapping(value = "/getGoodsDetailById", method = POST)
    public Map<String, Object> getGoodDetail(String goodsId) {
        Map<String, Object> result = new HashMap<>(2);
        GoodsInfo info = goodsInfoService.findById(goodsId);
        if ("详情".equals(info.getDetail())) {
            TbDataCraw tbDataCraw = new TbDataCraw();
            String detail = tbDataCraw.soupTmallDetailById(info.getGoodsId());
            goodsInfoService.updateGoodsDetailById(goodsId, detail);
            info.setDetail(detail);
        }
        List<?> price = goodsInfoService.selectPriceById(goodsId);
        result.put("info", info);
        result.put("price", price);
        return result;
    }


    @RequestMapping(value = "/crawTbGoodsInfo", method = GET)
    public String crawTbGoodsInfo(String keyword) {

        String topicName = "crawTbGoodsInfo";
        Flink2GoodsInfoService fgs = new Flink2GoodsInfoService(topicName);
        KafkaUtil ku = fgs.getKafkaUtil();
        ku.setKeyword(keyword);
        Thread thread = new Thread(ku);
        thread.start();

        Thread t = new Thread(fgs);
        t.start();
        return "爬取数据完成";
    }

    @ResponseBody
    @RequestMapping(value = "/crawGoodsDetail")
    public String crawGoodsPrice() throws InterruptedException {
        List<GoodsInfo> list = goodsInfoService.selectAll();
        TbDataCraw tbDataCraw = new TbDataCraw();
        Timer timer = new Timer();//实例化Timer类
        int i = 0;
        Thread.sleep(1000 * 4);
        for (GoodsInfo g : list) {
            String detail = tbDataCraw.soupTmallDetailById(g.getGoodsId());
            g.setDetail(detail);
            goodsInfoService.updateGoodsDetailById(g.getGoodsId(), detail);
//            int ran = (int)(1000*Math.random()+1500);
            Thread.sleep(1000 * 4);
            System.out.println("detail" + (i++) + ">>" + detail);
        }
        return "更新完成";
    }
}