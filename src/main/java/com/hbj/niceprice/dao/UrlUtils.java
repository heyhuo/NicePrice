package com.hbj.niceprice.dao;


import org.springframework.util.StringUtils;

public class UrlUtils {
    public static UrlData analyseUrl(String url) {

        UrlData urlData = new UrlData();
        try {

            // 判空
            if (StringUtils.isEmpty(url)) {
                urlData.setStatus(0);
                return urlData;
            }

            //天猫
            if (url.contains(UrlConst.tmallUrlSign)) {

                urlData.setPlatform(UrlConst.tmallUrlSign);
                String numberStr = "";

                /**
                 * 切分根路径 和 参数 如：
                 * https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.8.27832a99AfoD5W&id=604433373792
                 * 在 ？问号的地方切成两部分
                 *
                 */
                String[] roudAndParams = url.split("\\?");

                if (roudAndParams.length < 2) {
                    urlData.setStatus(0);
                    return urlData;
                }

                /**
                 * 获取 参数字符串，通过&切开多个参数，提取以 id=开头的即 商品id
                 */
                String paramStr = roudAndParams[1];
                String[] params = paramStr.split("&");
                for (int i = 0; i < params.length; i++) {
                    if (params[i].startsWith("id=")) {
                        numberStr = params[i].split("id=")[1];
                        break;
                    }
                }

                if (StringUtils.isEmpty(numberStr)) {
                    urlData.setStatus(0);
                    return urlData;
                }

                Long number = new Long(numberStr);
                urlData.setStatus(1);
                urlData.setNumber(number);
                return urlData;

            }
            //淘宝
            else if (url.contains(UrlConst.taobaoUrlSign)) {

                urlData.setPlatform(UrlConst.taobaoUrlSign);
                String numberStr = "";

                /**
                 * 切分根路径 和 参数 如：
                 * https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.8.27832a99AfoD5W&id=604433373792
                 * 在 ？问号的地方切成两部分
                 *
                 */
                String[] roudAndParams = url.split("\\?");

                if (roudAndParams.length < 2) {
                    urlData.setStatus(0);
                    return urlData;
                }

                /**
                 * 获取 参数字符串，通过&切开多个参数，提取以 id=开头的即 商品id
                 */
                String paramStr = roudAndParams[1];
                String[] params = paramStr.split("&");
                for (int i = 0; i < params.length; i++) {
                    if (params[i].startsWith("id=")) {
                        numberStr = params[i].split("id=")[1];
                        break;
                    }
                }

                if (StringUtils.isEmpty(numberStr)) {
                    urlData.setStatus(0);
                    return urlData;
                }

                Long number = new Long(numberStr);
                urlData.setStatus(1);
                urlData.setNumber(number);
                return urlData;
            }
            //其他
            else if (url.contains(UrlConst.jingdongUrlSign)) {

                urlData.setPlatform(UrlConst.jingdongUrlSign);
                String numberStr = "";
                String[] roudAndParams = url.split("jd\\.com/");

                if (roudAndParams.length < 2) {
                    urlData.setStatus(0);
                    return urlData;
                }

                String paramStr = roudAndParams[1];
                String[] params = paramStr.split(".html");
                numberStr = params[0];

                if (StringUtils.isEmpty(numberStr)) {
                    urlData.setStatus(0);
                    return urlData;
                }

                Long number = new Long(numberStr);
                urlData.setStatus(1);
                urlData.setNumber(number);
                return urlData;
            } else {
                urlData.setStatus(0);
                return urlData;
            }
        } catch (Exception e) {
            e.printStackTrace();
            urlData.setStatus(0);
            return urlData;
        }

    }

}
