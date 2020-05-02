package com.hbj.niceprice.controller;

import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.service.Flink2GoodsInfoService;
import com.hbj.niceprice.service.GoodsInfoService;
import com.hbj.niceprice.util.KafkaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@RestController
@RequestMapping("/hbj")
public class GoodsController {

    @Autowired
    private GoodsInfoService goodsInfoService;

    @ResponseBody
    @RequestMapping("/getGoodsList")
    public List<GoodsInfo> getGoodsList() {
        return goodsInfoService.selectAll();
    }

    @ResponseBody
    @RequestMapping(value = "/getDoodDetail", method = GET)
    public GoodsInfo getGoodDetail(String id) {
        return goodsInfoService.findById(id);
    }

    @RequestMapping(value = "/crawTbGoodsInfo")
    public void crawTbGoodsInfo() throws Exception {
        String topicName = "crawTbGoodsInfo";
        Flink2GoodsInfoService fgs = new Flink2GoodsInfoService(topicName);
        fgs.crawGoodsList();

        KafkaUtil ku = fgs.getKafkaUtil();
        ku.setKeyword("耳机");
        Thread thread = new Thread(ku);
        thread.start();
    }
}