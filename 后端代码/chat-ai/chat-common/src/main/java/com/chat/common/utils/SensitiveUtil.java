package com.chat.common.utils;

import com.alibaba.fastjson.JSONObject;
import okhttp3.*;

import java.io.IOException;

public class SensitiveUtil {
    public static final String API_KEY = "IYV3x4pXN4nK2u1hgYs3TcCo";
    public static final String SECRET_KEY = "EdrGsLzibX97Zq4Ky9p9zVjq8TtzLsol";

    static final OkHttpClient HTTP_CLIENT = new OkHttpClient().newBuilder().build();

    public static Integer main(String content) throws IOException {
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        RequestBody body = RequestBody.create(mediaType, "text=" + content);
        Request request = new Request.Builder()
                .url("https://aip.baidubce.com/rest/2.0/solution/v1/text_censor/v2/user_defined?access_token=" + getAccessToken())
                .method("POST", body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .addHeader("Accept", "application/json")
                .build();
        Response response = null;
        try {
            response = HTTP_CLIENT.newCall(request).execute();
            String string = response.body().string();
            System.out.println(string);
            JSONObject jsonObject = JSONObject.parseObject(string);
            if (jsonObject.get("conclusion").toString().equals("合规")) {
                return 0;
            } else {
                return 1;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return 1;
    }


    /**
     * 从用户的AK，SK生成鉴权签名（Access Token）
     *
     * @return 鉴权签名（Access Token）
     * @throws IOException IO异常
     */
    static String getAccessToken() throws IOException {
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        RequestBody body = RequestBody.create(mediaType, "grant_type=client_credentials&client_id=" + API_KEY
                + "&client_secret=" + SECRET_KEY);
        Request request = new Request.Builder()
                .url("https://aip.baidubce.com/oauth/2.0/token")
                .method("POST", body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .build();
        Response response = HTTP_CLIENT.newCall(request).execute();
        JSONObject jsonObject = JSONObject.parseObject(response.body().string());
        return jsonObject.get("access_token").toString();
    }

}