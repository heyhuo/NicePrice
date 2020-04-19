package com.hbj.niceprice.dao;

import com.hbj.niceprice.entity.Product;
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

import java.util.List;

public class TbDataCraw {
    /*通过关键字查询商品列表详细信息*/
    public static List<Product> soupTaobaoByKeyWord(String keyword) {
        try {
            String input = keyword;
            // 需要爬取商品信息的网站地址 实际中把input改成 keyword
            String url = "https://list.tmall.com/search_product.htm?q=" + input;
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
//                    System.out.println(doc);
                    // 通过浏览器查看商品页面的源代码，找到信息所在的div标签，再对其进行一步一步地解析
//                    Elements ulList = doc.select("div[class='view']");
                    Elements ulList = doc.select("#J_ItemList");
                    Elements liList = ulList.select("div[class='product']");
                    // 循环liList的数据（具体获取的数据值还得看doc的页面源代码来获取，可能稍有变动）
//                    System.out.println("---------------length:"+liList.size()+"========");
                    for (Element item : liList) {
                        // 商品ID
//                        String id = item.select("div[class='product']").select("p[class='productStatus']").select("span[class='ww-light ww-small']").attr("data-item");
                        String id = item.select("div[class='product']").attr("data-id");
                        System.out.println("商品ID：" + id);
                        // 商品名称
                        String name = item.select("p[class='productTitle']").select("a").attr("title");
                        System.out.println("商品名称：" + name);
                        // 商品价格
                        String price = item.select("p[class='productPrice']").select("em").attr("title");
                        System.out.println("商品价格：" + price);
                        // 商品网址
                        String goodsUrl = item.select("p[class='productTitle']").select("a").attr("href");
                        System.out.println("商品网址：" + goodsUrl);
                        // 商品图片网址
                        String imgUrl = item.select("div[class='productImg-wrap']").select("a").select("img").attr("data-ks-lazyload");
                        System.out.println("商品图片网址：" + imgUrl);
                        System.out.println("------------------------------------");
                    }
                    // 消耗掉实体
                    EntityUtils.consume(response.getEntity());
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
    public static Product soupTmallDetailById(Long number) {
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
                    Product product = new Product();
                    //for (Element item : ulList) {
                    // 商品ID
                    try {
                        product.setNumber(number);
                        product.setPlatformId(1);
                        //String id = item.select("div[class='tb-detail-hd']").select("h1").attr("data-spm");
                        String title = item.select("div[class='tb-detail-hd']").select("h1").text();
                        product.setTitle(title);
                        product.setUrl(UrlConst.TMALL_PRODUCT_DETAIL + number);

                        System.out.println("商品title：" + title);
                        //String priceStr = item.select("div[class='tm-price-panel']").select("div[class='tm-promo-type']").select("span[class='tm-price']").text();

                        return product;
                    } catch (Exception e) {
                        product.setId(0L);
                        product.setTitle("商品不存在");
                        return product;
                    }
                    // }
                }
            } catch (Exception e) {
                e.printStackTrace();
                Product product = new Product();
                product.setId(0L);
                product.setTitle("商品不存在");
                return product;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
