package com.hbj.niceprice.controller;

import com.hbj.niceprice.util.TbDataCraw;
import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.service.goodsInfo.GoodsInfoKafka2FlinkService;
import com.hbj.niceprice.service.goodsInfo.GoodsInfoService;
import com.hbj.niceprice.params.Catalogs;
import com.hbj.niceprice.service.goodsInfo.GoodsInfoKafka;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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

    /* 根据用户输入关键字搜索数据库 */
    @ResponseBody
    @RequestMapping(value = "/searchGoodsByGoodsName", method = POST)
    public List<GoodsInfo> searchGoodsByGoodsName(String goodsName) {
        return goodsInfoService.searchGoodsByGoodsName("%" + goodsName + "%");
    }

    @RequestMapping(value = "/crawTbGoodsInfo", method = GET)
    public String crawTbGoodsInfo(String keyword) {

        String topicName = "crawTbGoodsInfo";
        GoodsInfoKafka2FlinkService fgs = new GoodsInfoKafka2FlinkService(topicName);
        GoodsInfoKafka goodsInfoKafka = new GoodsInfoKafka(null, fgs.getKafkaUtil());
        Thread thread = new Thread(goodsInfoKafka);
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