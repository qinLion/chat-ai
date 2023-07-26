package com.chat.system.service;

import com.alibaba.fastjson.JSONObject;
import com.chat.common.core.domain.AjaxResult;

public interface ApplePayService {

    AjaxResult getAppPay(String productId, JSONObject jsonObject, String status, Integer userId);

    String create(String productId, Integer userId, String orderId);
}
