package com.hbj.niceprice.dao;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hbj.niceprice.entity.GoodsInfo;
import com.hbj.niceprice.entity.Product;

import com.hbj.niceprice.util.UrlConst;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

public class TbDataCraw {
    /*通过关键字查询商品列表详细信息*/
    public List<GoodsInfo> soupTMALLGoodsListByKey(String keyword) {
        try {
            // 需要爬取商品信息的网站地址
            String url = "https://list.tmall.com/search_product.htm?q=" + keyword;
            // 动态模拟请求数据
            CloseableHttpClient httpclient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            // 模拟浏览器浏览（user-agent的值可以通过浏览器浏览，查看发出请求的头文件获取）
            httpGet.setHeader("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36");
            CloseableHttpResponse response = httpclient.execute(httpGet);
            // 获取响应状态码
            int statusCode = response.getStatusLine().getStatusCode();
            try {
                HttpEntity entity = response.getEntity();
                // 如果状态响应码为200，则获取html实体内容或者json文件
                if (statusCode == 200) {
                    List<GoodsInfo> resultList = new ArrayList<>();
                    String html = EntityUtils.toString(entity, Consts.UTF_8);
                    // 提取HTML得到商品信息结果
                    Document doc = null;
                    // doc获取整个页面的所有数据
                    doc = Jsoup.parse(html);
                    //输出doc可以看到所获取到的页面源代码
                    System.out.println(doc);
                    // 通过浏览器查看商品页面的源代码，找到信息所在的div标签，再对其进行一步一步地解析
//                    Elements ulList = doc.select("div[class='view']");

                    String variety = doc.select(".attrKey").select("a").attr("title");
                    Elements tagList = doc.select("ul[class='av-expand']").select("li");
                    List<String> tags = new ArrayList<>();
                    for (Element item : tagList) {
                        tags.add(item.select("a").attr("title"));
                    }
                    String tag = tags.toString();
                    Elements ulList = doc.select("#J_ItemList");
                    Elements liList = ulList.select("div[class='product']");
                    // 循环liList的数据（具体获取的数据值还得看doc的页面源代码来获取，可能稍有变动）
//                    System.out.println("---------------length:"+liList.size()+"========");

                    for (Element item : liList) {
                        // 商品ID
//                        String id = item.select("div[class='product']").select("p[class='productStatus']").select("span[class='ww-light ww-small']").attr("data-item");
                        String id = item.select("div[class='product']").attr("data-id");

                        // 商品名称
                        String name = item.select("p[class='productTitle']").select("a").attr("title");

                        // 商品价格
                        String price = item.select("p[class='productPrice']").select("em").attr("title");

                        // 商品网址
                        String goodsUrl = item.select("p[class='productTitle']").select("a").attr("href");

                        // 商品图片网址
                        String imgUrl = item.select("div[class='productImg-wrap']").select("a").select("img").attr("data-ks-lazyload");

                        String https = "https:";
                        GoodsInfo goodsInfo = new GoodsInfo(id, name, price, variety, tag, "详情", https + imgUrl, https + goodsUrl, "TMALL", "0");
//
                        resultList.add(goodsInfo);
//                        System.out.println(goodsInfo.toString());
                    }
                    // 消耗掉实体
                    EntityUtils.consume(response.getEntity());
                    return resultList;
                } else {
                    // 消耗掉实体
                    EntityUtils.consume(response.getEntity());
                }
            } finally {
                response.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /*获取商品详细信息*/
    public static GoodsInfo soupTmallDetailById(Long number) {
        try {
            // 需要爬取商品信息的网站地址
            String url = "https://chaoshi.detail.tmall.com/item.htm?id=" + number;
            // 动态模拟请求数据
            CloseableHttpClient httpclient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            // 模拟浏览器浏览（user-agent的值可以通过浏览器浏览，查看发出请求的头文件获取）
            httpGet.setHeader("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36");
            CloseableHttpResponse response = httpclient.execute(httpGet);
            // 获取响应状态码
            int statusCode = response.getStatusLine().getStatusCode();
            try {
                HttpEntity entity = response.getEntity();
                // 如果状态响应码为200，则获取html实体内容或者json文件
                if (statusCode == 200) {
                    String html = EntityUtils.toString(entity, Consts.UTF_8);
                    // 提取HTML得到商品信息结果
                    Document doc = null;
                    // doc获取整个页面的所有数据
                    doc = Jsoup.parse(html);
                    //输出doc可以看到所获取到的页面源代码
                    //System.out.println(doc);
                    // 通过浏览器查看商品页面的源代码，找到信息所在的div标签，再对其进行一步一步地解析
                    Element item = doc.select("div[class='tb-wrap']").get(0);
                    //Elements liList = ulList.select("div[class='product']");
                    // 循环liList的数据（具体获取的数据值还得看doc的页面源代码来获取，可能稍有变动）
                    //System.out.println("item = " + item);
                    GoodsInfo goodsInfo = new GoodsInfo();
                    //for (Element item : ulList) {
                    // 商品ID
                    try {
                        goodsInfo.setGoodsId(number.toString());
                        goodsInfo.setPlatForm("TMALL");
                        //String id = item.select("div[class='tb-detail-hd']").select("h1").attr("data-spm");
                        String title = item.select("div[class='tb-detail-hd']").select("h1").text();
                        goodsInfo.setGoodsName(title);
                        goodsInfo.setLink(UrlConst.TMALL_PRODUCT_DETAIL + number);

                        System.out.println("商品title：" + title);
                        //String priceStr = item.select("div[class='tm-price-panel']").select("div[class='tm-promo-type']").select("span[class='tm-price']").text();

                        return goodsInfo;
                    } catch (Exception e) {
                        return null;
                    }
                    // }
                }
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void main(String[] args) {
        this.soupTMALLGoodsListByKey("airpods2");
    }
}
