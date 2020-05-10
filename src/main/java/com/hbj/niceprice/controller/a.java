package com.hbj.niceprice.controller;


import com.alibaba.fastjson.JSONObject;
import com.hbj.niceprice.entity.IPort;
import com.sun.deploy.net.MessageHeader;
import org.apache.commons.lang.StringUtils;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import static java.lang.Integer.getInteger;
import static java.lang.Integer.parseInt;

public class a {
//    public static void main(String[] args) throws Exception {
//        //天猫链接
//        String url = "https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.13.334a2516Z44rJj&id=605891749329&skuId=4247606565698&areaId=110100&user_id=2397808261&cat_id=2&is_b=1&rn=796960b49886054f5adf63e3732263bf";
//        int beginId = url.indexOf("&id=")+"&id=".length();
//        String ss = url.substring(beginId);
//        int endId = ss.indexOf("&");
//        //截取链接中的id
//        String id = url.substring(beginId,endId+beginId);
//        int beginskuId = url.indexOf("skuId=")+"skuId=".length();
//        String ss1 = url.substring(beginskuId);
//        int endskuId = ss1.indexOf("&");
//        //截取链接中的skuId
//        String skuId = url.substring(beginskuId,endskuId+beginskuId);
//        //拼接成新的天猫链接
//        String newUrl = "https://detail.tmall.com/item.m?id="+id+"&skuId="+skuId;
//        //拼接成新的获取价格的链接
//        String priceUrl = "https://mdskip.taobao.com/core/initItemDetail.htm?itemId="+id;
//        HttpClientBuilder builder = HttpClients.custom();
//        builder.setUserAgent("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:0.9.4)");
//        CloseableHttpClient httpClient = builder.build();
//        final HttpGet httpGet = new HttpGet(priceUrl);
//        //因天猫反扒机制，设置header
//        httpGet.addHeader("Referer", "https://mdskip.taobao.com//core/initItemDetail.htm/_____tmd_____/punish?x5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f78005654c1c031882a4c6dbedc85c51a441e3b919afa3298cff90c7626668fde860480def1935cf7544236ad19f2057552faa04c5a4741d78a3444916b235ae29cba45bd36bb8e49de97f26cfdecdbf948396052f1caa3b074546afe1c63fda94f00013ede75fd2a9d8eb3665574184336b45fc8a83fb7899cb8ec1e17b434d60fc4f66162bb2f483ccf2b55d158c298559fdc7b6ce8d2a594959dc501c6600df14872d54e92099cf7195680d2ba3b88511f76a4dbb2b594f8c93b60b948d1702fc695fdfb4765ce3b35f862ccc49a7ddbc070bd41eaf21a1d470b225d2dd40c0cafb3f59c461c51b8d9da168f0e68f989878b25517da9db5e2a0f7f0a1b8e6130c9c58bbe9ca0d4667afa0e550cc8ca351677f0472a23701cb860d0d41b647a37c8248933146442ba6ff7f958e4788f6268332ab21102bb58aa52e29810b4b19c0c1df8c88bfca12a767e0118f8a56142989ab47c351d91b6c92135d43282b79e7761d10039ab8ebcc28bec399e580b54b24749603dfa93a95d2702cbc2acfc327f5f8a7739d78cacb54f2d194ad3c969af6c5a446d8cd63d7eaa38b14d6c7a048ddf8ade6b164b9479e80cc95859b3f7&x5step=2");
//        httpGet.addHeader("Sec-Fetch-Mode", "no-cors");
//        httpGet.addHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36");
//        httpGet.addHeader("cookie", "t=6a61f92ccbd970e84526ac1f5f16b5ca; UM_distinctid=16dc4a60e3b604-066db812675b97-386a410b-100200-16dc4a60e3c2c6; miid=248548291090120761; tk_trace=oTRxOWSBNwn9dPyorMJE%2FoPdY8zfvmw%2Fq5hmCUfRWfRinUXBTBL%2BCO%2FNzRpSKWNvEzD5AocUKglf3lGWFQAqmEdNHvK6DuuBIN20rHgsBPCaU9DrSMoukYv0XWHaEJsmT0d7YdHvMiCLs6Jt7vIT%2BqnJvRzOAaMVzZJjOKEECr5uohFVYvvaBN7MUJjRsGU3g8mhPnv%2BHhlfUAnfGnZeMe2yT2M%2BWxPlTYMMlH0gytXsLZb%2BkDuGefoQG7caVJjdMuCN2Voc67K%2FWCfrEG25oRrsog%3D%3D; cookie2=120e0680b568ad50f0c72733499e7956; _tb_token_=fed3d4e460706; v=0; cna=8tEpFixmOiICAW64zk6EFHTi; unb=2044069096; uc1=existShop=false&pas=0&tag=8&lng=zh_CN&cookie14=UoTbldM7nmU%2Fvw%3D%3D&cookie16=VT5L2FSpNgq6fDudInPRgavC%2BQ%3D%3D&cookie15=Vq8l%2BKCLz3%2F65A%3D%3D&cookie21=URm48syIZJwTkNGk7euL6g%3D%3D; uc3=id2=UUjViSNYfbKLAw%3D%3D&lg2=Vq8l%2BKCLz3%2F65A%3D%3D&vt3=F8dBxdgpCfFJT%2BAlFmA%3D&nk2=D85B8wMn1%2B%2BGl1pynPVn; csg=b2beedab; lgc=lmd%5Cu5F85%5Cu4F60%5Cu957F%5Cu53D1%5Cu53CA%5Cu8170; cookie17=UUjViSNYfbKLAw%3D%3D; dnk=lmd%5Cu5F85%5Cu4F60%5Cu957F%5Cu53D1%5Cu53CA%5Cu8170; skt=ed8770349f9c6948; existShop=MTU3ODE4ODE2NQ%3D%3D; uc4=nk4=0%40De3W3b9EisQm60ydmctSvpRH%2FFEV6sw56RY%3D&id4=0%40U2o3vUzmEscWShqVUst018sE7Tjc; tracknick=lmd%5Cu5F85%5Cu4F60%5Cu957F%5Cu53D1%5Cu53CA%5Cu8170; _cc_=U%2BGCWk%2F7og%3D%3D; tg=0; _l_g_=Ug%3D%3D; sg=%E8%85%B063; _nk_=lmd%5Cu5F85%5Cu4F60%5Cu957F%5Cu53D1%5Cu53CA%5Cu8170; cookie1=AnCBIq9bOXVNWWlLCosHrWeRXuCnIYtL8x9Jt2vZR%2Bo%3D; enc=zoiogTkjkBtYr7w9dRq32fT7A2QRUm%2BmihpGKejzoHJ5V7bpTmXohUbHW0hPAqmdvvJ5kjRvIiN3BOvq8xuTmg%3D%3D; isg=BLy8y4Bjzl7KS_oCe0icPF42jVquHWDX1pn1I5Y9w6eKYVzrvsFqbzPQRcm8LJg3; l=dBxkNf0qQLHcPYBTBOCaourza77TIIRYSuPzaNbMi_5Qg6Ts_-bOoxN1tF96cjWf9lTB45113tv9-etk2UMqWXSpXUJ6nxDc.; ucn=center; x5sec=7b226d616c6c64657461696c736b69703b32223a226665386164646134356164313163333737633735623463313535353734383134434a793078664146454f37653662762b322f436548786f4d4d6a41304e4441324f5441354e6a7331227d");
//        CloseableHttpResponse response = null;
//        String result = null;
//        try {
//            response = httpClient.execute(httpGet);
//
//            final HttpEntity entity = response.getEntity();
//
//            if (entity != null) {
//                result = EntityUtils.toString(entity);
//                EntityUtils.consume(entity);
//                //获取价格
////                JSONObject object = new JSONObject(result);
////                JSONObject object2 = (JSONObject)object.get("defaultModel");
////                JSONObject object3 = (JSONObject)object2.get("itemPriceResultDO");
////                JSONObject object4 = (JSONObject)object3.get("priceInfo");
////                JSONObject object5 = (JSONObject)object4.get(skuId);
////                JSONArray jsonArray = new JSONArray(object5.get("promotionList").toString());
////                if(jsonArray.length()==1){
////                    JSONObject object6 = (JSONObject)jsonArray.get(0);
////                    System.out.println("价格===="+object6.get("price"));
////                }
//
//                response.close();
//                httpClient.close();
//            }
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//    }

    /**
     * 根据移动端接口获取淘宝详情页数据
     *
     * @param goodsId 商品ID
     * @return
     */
    public static String getGoodsDetails(String ip, int port, String goodsId) {
        String content = null;
        try {
            Thread.sleep(10000);
            CloseableHttpClient client = HttpClients.custom().build();
            HttpGet get = new HttpGet("https://h5api.m.taobao.com/h5/mtop.taobao.detail.getdetail/6.0/?data=" + URLEncoder.encode("\"itemNumId\":\"" + goodsId + "\"", "utf-8"));
            get.setHeader("referer", "https://m.intl.taobao.com/detail/detail.html?id=" + goodsId);
            get.setHeader("user-agent", "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Mobile Safari/537.36");

            HttpHost proxy = new HttpHost(ip, port);
            RequestConfig requestConfig = RequestConfig.custom().setProxy(proxy)
                    .setConnectTimeout(3000)
                    .setSocketTimeout(3000)
                    .setConnectionRequestTimeout(3000).build();
            get.setConfig(requestConfig);

            int times = 0;
            while (times < 3) {
                try (CloseableHttpResponse response = client.execute(get)) {
                    HttpEntity entity = response.getEntity();
                    content = EntityUtils.toString(entity);
                    if (StringUtils.isBlank(content)) {
                        times += 1;
                    } else {
                        break;
                    }
                } catch (Exception ex) {
                    Thread.sleep(6000);
                    times += 1;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }

    public static Document setProxyIpList() {
        try {
            String rLine;
            String url = "http://www.xicidaili.com/";
            // 动态模拟请求数据
            CloseableHttpClient httpclient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(url);
            // 模拟浏览器浏览（user-agent的值可以通过浏览器浏览，查看发出请求的头文件获取）
            httpGet.setHeader("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36");
            CloseableHttpResponse response = httpclient.execute(httpGet);
            // 获取响应状态码
            int statusCode = response.getStatusLine().getStatusCode();
            HttpEntity entity = response.getEntity();
            // 如果状态响应码为200，则获取html实体内容或者json文件
            if (statusCode == 200) {
                String html = null;
                try {
                    html = EntityUtils.toString(entity, Consts.UTF_8);
                    Document doc = Jsoup.parse(html);
                    return doc;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<IPort> getIpAndPort(Document doc) {
        List<IPort> list = new ArrayList<>();
        if (doc == null) {
            list.add(new IPort("", 0));
            return list;
        }
        Elements tr1 = doc.select("tr[class='']");
        Elements tr2 = doc.select("tr[class='odd']");
        tr2.addAll(tr1);

        String ipReg = "\\d+\\.\\d+\\.\\d+\\.\\d+";  //匹配ip
        String portRreg = "\\d+";                         //匹配端口号
        for (Element e : tr2) {
            Elements tds = e.select("td");
            IPort iPort = new IPort(null, null);
            for (Element t : tds) {
                String td = t.text();
                if (Pattern.matches(ipReg, td))
                    iPort.setIp(td);
                if (Pattern.matches(portRreg, td))
                    iPort.setPort(Integer.valueOf(td));
            }
            list.add(iPort);
        }
        return list;
    }


    public static void main(String[] args) {
//        if (ip != null && !ip.equals("")) {
//            HttpHost proxy = new HttpHost(ip, port);
//            httpClient.getParams().setParameter(ConnRouteParams.DEFAULT_PROXY, proxy);
//        }
        List<IPort> iPortList = getIpAndPort(setProxyIpList());
        String ip = iPortList.get(51).getIp();
        Integer port = iPortList.get(51).getPort();
        getGoodsDetails("", 0, "38235209262");
//        System.out.println(s);
//
    }
}
