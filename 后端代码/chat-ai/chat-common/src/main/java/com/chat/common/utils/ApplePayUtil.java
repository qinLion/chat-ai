package com.chat.common.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.net.ssl.*;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Locale;

@Component
public class ApplePayUtil {


    private static class TrustAnyTrustManager implements X509TrustManager {


        @Override
        public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        }

        @Override
        public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        }

        @Override
        public X509Certificate[] getAcceptedIssuers() {
            return new X509Certificate[]{};
        }
    }

    private static class TrustAnyHostnameVerifier implements HostnameVerifier {
        @Override
        public boolean verify(String hostname, SSLSession session) {
            return true;
        }
    }


    /**
     * 苹果服务器验证
     *
     * @param receipt 账单
     * @return null 或返回结果
     * @url 要验证的地址 沙盒 https://sandbox.itunes.apple.com/verifyReceipt
     */
    public String buyAppVerify(String receipt, int type) {
        //环境判断 线上/开发环境用不同的请求链接
        try {
            String url = null;
            if (type == 0) {
                url = "https://sandbox.itunes.apple.com/verifyReceipt"; //沙盒环境,测试
            } else {
                url = "https://buy.itunes.apple.com/verifyReceipt"; //线上环境
            }
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, new TrustManager[]{new TrustAnyTrustManager()}, new java.security.SecureRandom());
            URL console = new URL(url);
            HttpsURLConnection conn = (HttpsURLConnection) console.openConnection();
            conn.setSSLSocketFactory(sc.getSocketFactory());
            conn.setHostnameVerifier(new TrustAnyHostnameVerifier());
            conn.setRequestMethod("POST");
            conn.setRequestProperty("content-type", "text/json");
            conn.setRequestProperty("Proxy-Connection", "Keep-Alive");
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setConnectTimeout(3000);
            BufferedOutputStream hurlBufOus = new BufferedOutputStream(conn.getOutputStream());
            //拼成固定的格式传给平台
            String str = String.format(Locale.CHINA, "{\"receipt-data\":\"" + receipt + "\"}");
            // 直接将receipt当参数发到苹果验证就行，不用拼格
            //String str = String.format(Locale.CHINA, receipt);
            hurlBufOus.write(str.getBytes());
            hurlBufOus.flush();

            InputStream is = conn.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(is));
            String line = null;
            StringBuilder sb = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            return sb.toString();
        } catch (Exception ex) {
            System.out.println("苹果服务器异常");
            ex.printStackTrace();
        }
        return null;

    }
}
