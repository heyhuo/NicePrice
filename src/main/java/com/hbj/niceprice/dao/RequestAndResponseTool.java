//package com.hbj.niceprice.dao;
//
//
//import com.hbj.niceprice.util.Page;
//import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
//import org.apache.commons.httpclient.HttpClient;
//import org.apache.commons.httpclient.HttpException;
//import org.apache.commons.httpclient.HttpStatus;
//import org.apache.commons.httpclient.methods.GetMethod;
//import org.apache.commons.httpclient.params.HttpMethodParams;
//
//import java.io.IOException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//public class RequestAndResponseTool {
//
//
//    public static Page sendRequstAndGetResponse(String url, String dianshang) {
//        Page page = null;
//        // 1.生成 HttpClinet 对象并设置参数
//        HttpClient httpClient = new HttpClient();
//        // 设置 HTTP 连接超时 5s
//        httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
//        // 2.生成 GetMethod 对象并设置参数
//        GetMethod getMethod = new GetMethod(url);
//        //zz设置请求头
//        Date date = new Date();
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("");
//        System.out.println(date);
//        //cna=xc8QFScq3mMCAXWIdnNklw/5; x=__ll%3D-1%26_ato%3D0; enc=22D2pCkbDgD4j4NI690F1syj2pzcmVODKNelTBhnJFSbQKa86y3R4gP2f957TU49KrG4i8Z8A0GZ8WP3yEz0%2BQ%3D%3D; _med=dw:1920&dh:1080&pw:1920&ph:1080&ist:0; otherx=e%3D1%26p%3D*%26s%3D0%26c%3D0%26f%3D0%26g%3D0%26t%3D0; tk_trace=1; hng=CN%7Czh-CN%7CCNY%7C156; t=2feeba33aa8d109a344fc80c085e942e; lid=%E5%85%8B%E6%8B%89%E5%A4%AB%E5%93%88%E8%8B%8F%E4%B8%9C%E5%9D%A1; _tb_token_=e687eb397a673; cookie2=1a050f7d908b3b750603a0c1a47df435; tt=tmall-main; pnm_cku822=098%23E1hv%2BvvUvbpvUvCkvvvvvjiPRLFwtjnCPssyljljPmPW6j1nP2Fw1jDvPsqy6j3WvphvCyCCvvvvvbyCvm3vpvvvvvCvphCvjvUvvhP7phvwv9vvBj1vpCQmvvChpyCvjvUvvhBmuphvmhCvC8evVczpkphvCyEmmvo4e9yCvh1CVfQvIqU3o5%2BO3w0AhjEmJDKXlLJ1nH6Sp42EHFiihFnhiaV1nV9w4B8n3feAOHCTmEcBKFyK2kyZD70wd5QXVAtlK24Abyy6cPs92QhvCvvvMMGtvpvhphvvv8wCvvBvpvpZ; res=scroll%3A1899*5994-client%3A1899*917-offset%3A1899*5994-screen%3A1920*1080; cq=ccp%3D1; isg=BOnpwpgOkbToia07swi_dp8F7JVJNmK-_aISFYveTlBJUgtk0weRvaMEELRBFXUg; l=bBO58m_qvAtE67oMBOCwqZZ49EbTALRb6uWbggHei_5CF19fmY_OlML0Le96VjCP9iTB4QAn21ytieD4rzkf.
//        if (dianshang.equals("tm")) {
//            getMethod.setRequestHeader("cookie", "");
//            getMethod.setRequestHeader("user-agent", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36");
//            //getMethod.setRequestHeader("refer","https://list.tmall.com/search_product.htm?q=shouji+&type=p&vmarket=&spm=875.7931836%2FB.a2227oh.d100&from=mallfp..pc_1_searchbutton");
//            //Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Mobile Safari/537.36
//            //enc
//        }
//
//        if (!dianshang.equals("tm")) {
//            getMethod.setRequestHeader("user-agent", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36");
//        }
//        //zz设置编码格式Content-Encoding →gzip
//        //getMethod.setRequestHeader("Content-Encoding","GBKs");
//        // 设置 get 请求超时 5s
//        getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
//        // 设置请求重试处理
//        getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler());
//        // 3.执行 HTTP GET 请求
//        try {
//            int statusCode = httpClient.executeMethod(getMethod);
//            // 判断访问的状态码
//            if (statusCode != HttpStatus.SC_OK) {
//                System.err.println("Method failed: " + getMethod.getStatusLine());
//            }
//            // 4.处理 HTTP 响应内容
//            byte[] responseBody = getMethod.getResponseBody();// 读取为字节 数组
//
//
//            if (dianshang.equals("al")) {
//                page = new Page(responseBody, url, null); //封装成为页面
//            } else {
//                String contentType = getMethod.getResponseHeader("Content-Type").getValue(); // 得到当前返回类型
//                page = new Page(responseBody, url, contentType); //封装成为页面
//            }
//        } catch (HttpException e) {
//            // 发生致命的异常，可能是协议不对或者返回的内容有问题
//            System.out.println("Please check your provided http address!");
//            e.printStackTrace();
//        } catch (IOException e) {
//            // 发生网络异常
//            e.printStackTrace();
//        } finally {
//            // 释放连接
//            getMethod.releaseConnection();
//        }
//        return page;
//    }
//}
//
