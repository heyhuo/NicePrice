package com.hbj.niceprice.service.goodsInfo;

import com.alibaba.fastjson.JSON;
import com.hbj.niceprice.util.TbDataCraw;
import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.params.Catalogs;
import com.hbj.niceprice.util.KafkaUtil;
import org.apache.kafka.clients.producer.ProducerRecord;

import java.util.ArrayList;
import java.util.List;

public class GoodsInfoKafka implements Runnable {
    private String keyword;
    private TbDataCraw tbDataCraw = new TbDataCraw();
    private KafkaUtil kafkaUtil;

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public GoodsInfoKafka(String keyword, String topicName) {
        kafkaUtil = new KafkaUtil(topicName);
        this.keyword = keyword;
    }

    public GoodsInfoKafka(String keyword, KafkaUtil kafkaUtil) {
        this.keyword = keyword;
        this.kafkaUtil = kafkaUtil;
    }

    @Override
    public void run() {
        List<GoodsInfo> goodsInfoList = new ArrayList<>();
        if (keyword != null) {  //单类爬虫
            goodsInfoList.addAll(tbDataCraw.soupTMALLGoodsListByKey(keyword));
        } else {    //类别爬虫
            for (Catalogs c : Catalogs.values()) {
                keyword = c.toString().split("_")[0];
                System.out.println("------------" + keyword + "-----------");
                goodsInfoList.addAll(tbDataCraw.soupTMALLGoodsListByKey(keyword));
            }
        }
        int i = 0;
        for (GoodsInfo g : goodsInfoList) {
            i++;
            System.out.println("序号-" + i + "  " + g.toString());
            ProducerRecord record = new ProducerRecord(kafkaUtil.topic, null, null, JSON.toJSONString(g));
            kafkaUtil.producer.send(record);
        }
        kafkaUtil.producer.flush();
    }

    public static void main(String[] args) {
        String topicName = "crawTbGoodsInfo";
        GoodsInfoKafka2FlinkService fgs = new GoodsInfoKafka2FlinkService(topicName);
        GoodsInfoKafka goodsInfoKafka = new GoodsInfoKafka(null, fgs.getKafkaUtil());
        Thread thread = new Thread(goodsInfoKafka);
        thread.start();

        Thread t = new Thread(fgs);
        t.start();
    }
}
