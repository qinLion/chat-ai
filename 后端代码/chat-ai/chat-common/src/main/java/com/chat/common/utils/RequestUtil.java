package com.chat.common.utils;

import org.apache.http.HttpEntity;
import org.apache.http.ParseException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RequestUtil {

    /**
     * 发送get请求-无参
     *
     * @param url     请求url
     * @param headers 请求头
     * @return 响应体
     */
    public static String sendGetRequestNoParams(String url, Map<String, String> headers) {
        // 获得Http客户端
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        // 创建Get请求
        HttpGet httpGet = new HttpGet(url);
        // 设置请求头
        if (headers != null) {
            headers.forEach(httpGet::setHeader);
        }

        // 响应模型
        CloseableHttpResponse response = null;
        try {
            // 由客户端执行(发送)Get请求
            response = httpClient.execute(httpGet);
            // 从响应模型中获取响应实体
            HttpEntity responseEntity = response.getEntity();
            if (responseEntity != null) {
                return EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
            }
        } catch (ParseException | IOException e) {
            e.printStackTrace();
        } finally {
            try {
                // 释放资源
                if (httpClient != null) {
                    httpClient.close();
                }
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }


    /**
     * 发送get请求
     *
     * @param url       请求url
     * @param paramsMap 参数
     * @param headers   请求头
     * @return 响应体
     */
    public static String sendGetRequestNeedParams(String url, Map<String, String> paramsMap, Map<String, String> headers) {
        // 获得Http客户端
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();

        // 参数拼接
        List<String> params = new ArrayList<>();
        paramsMap.forEach((key, value) -> {
            try {
                // 字符数据最好encoding以下;这样一来，某些特殊字符才能传过去(如:某人的名字就是“&”,不encoding的话,传不过去)
                params.add(key + "=" + URLEncoder.encode(value, "utf-8"));
            } catch (UnsupportedEncodingException e1) {
                e1.printStackTrace();
            }
        });
        String paramsStr = String.join("&", params);
        if (StringUtils.isNotEmpty(paramsStr)) {
            url += "?" + paramsStr;
        }
        System.out.println("url=" + url);

        // 创建Get请求
        HttpGet httpGet = new HttpGet(url);
        // 设置请求头
        if (headers != null) {
            headers.forEach(httpGet::setHeader);
        }

        // 响应模型
        CloseableHttpResponse response = null;
        try {
            // 配置信息
            RequestConfig requestConfig = RequestConfig.custom()
                    // 设置连接超时时间(单位毫秒)
                    .setConnectTimeout(5000)
                    // 设置请求超时时间(单位毫秒)
                    .setConnectionRequestTimeout(5000)
                    // socket读写超时时间(单位毫秒)
                    .setSocketTimeout(5000)
                    // 设置是否允许重定向(默认为true)
                    .setRedirectsEnabled(true).build();
            // 将上面的配置信息 运用到这个Get请求里
            httpGet.setConfig(requestConfig);

            // 由客户端执行(发送)Get请求
            response = httpClient.execute(httpGet);

            // 从响应模型中获取响应实体
            HttpEntity responseEntity = response.getEntity();
            if (responseEntity != null) {
                return EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
            }
        } catch (ParseException | IOException e) {
            e.printStackTrace();
        } finally {
            try {
                // 释放资源
                if (httpClient != null) {
                    httpClient.close();
                }
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 发送post请求
     *
     * @param url             请求url
     * @param requestDataJson 请求体的数据，json格式
     * @param headers         请求头
     * @return 响应体
     */
    public static String sendPostRequestByJson(String url, String requestDataJson, Map<String, String> headers) {

        // 获得Http客户端
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();

        // 创建Post请求
        HttpPost httpPost = new HttpPost(url);

        // 将json数据放入entity中
        StringEntity entity = new StringEntity(requestDataJson, "UTF-8");

        // post请求是将参数放在请求体里面传过去的;这里将entity放入post请求体中
        httpPost.setEntity(entity);
        httpPost.setHeader("Content-Type", "application/json;charset=utf8");
        if (headers != null) {
            headers.forEach(httpPost::setHeader);
        }
        // 响应模型
        CloseableHttpResponse response = null;
        try {
            // 由客户端执行(发送)Post请求
            response = httpClient.execute(httpPost);
            // 从响应模型中获取响应实体
            HttpEntity responseEntity = response.getEntity();
            if (responseEntity != null) {
                return EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
            }
        } catch (ParseException | IOException e) {
            e.printStackTrace();
        } finally {
            try {
                // 释放资源
                if (httpClient != null) {
                    httpClient.close();
                }
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }


    /**
     * 发送post请求，表单形式，请求体放对象，而不是json串
     *
     * @param url     请求url
     * @param params  请求体中的参数
     * @param headers 请求头
     * @return
     */
    public static String sendPostRequestByForm(String url, Map<String, String> params, Map<String, String> headers) {
        // 获得Http客户端
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();

        // 创建Post请求
        HttpPost httpPost = new HttpPost(url);
        // 将请求数据放置请求体中
        List<BasicNameValuePair> paramList = new ArrayList<>();
        params.forEach((key, value) -> {
            paramList.add(new BasicNameValuePair(key, value));
        });
        UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(paramList, StandardCharsets.UTF_8);

        // post请求是将参数放在请求体里面传过去的;这里将entity放入post请求体中
        httpPost.setEntity(formEntity);
        httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded");
        if (headers != null) {
            headers.forEach(httpPost::setHeader);
        }
        // 响应模型
        CloseableHttpResponse response = null;
        try {
            // 由客户端执行(发送)Post请求
            response = httpClient.execute(httpPost);
            // 从响应模型中获取响应实体
            HttpEntity responseEntity = response.getEntity();
            if (responseEntity != null) {
                return EntityUtils.toString(responseEntity, StandardCharsets.UTF_8);
            }
        } catch (ParseException | IOException e) {
            e.printStackTrace();
        } finally {
            try {
                // 释放资源
                if (httpClient != null) {
                    httpClient.close();
                }
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
