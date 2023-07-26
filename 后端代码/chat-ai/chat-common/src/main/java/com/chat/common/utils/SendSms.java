package com.chat.common.utils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.profile.DefaultProfile;
import com.google.gson.Gson;

public class SendSms {
    public static void main(String[] args) throws Exception {
        boolean send = Send("15003574377", "7894");
    }

    public static boolean Send(String phone, String code) {

        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou",
                "LTAIFC6hVt8TC86r",
                "nJSCVtLqVaBlaIaWgQk4J5n8o1nCfw");
        IAcsClient client = new DefaultAcsClient(profile);

        SendSmsRequest request = new SendSmsRequest();
        request.setPhoneNumbers(phone);//接收短信的手机号码
        request.setSignName("阿里云短信测试");//短信签名名称
        request.setTemplateCode("SMS_154950909");//短信模板CODE
        request.setTemplateParam("{\"code\":" + code + "}");//短信模板变量对应的实际值

        try {
            SendSmsResponse response = client.getAcsResponse(request);
            System.out.println(new Gson().toJson(response));
            return true;
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            System.out.println("ErrCode:" + e.getErrCode());
            System.out.println("ErrMsg:" + e.getErrMsg());
            System.out.println("RequestId:" + e.getRequestId());
        }
        return false;
    }

}
