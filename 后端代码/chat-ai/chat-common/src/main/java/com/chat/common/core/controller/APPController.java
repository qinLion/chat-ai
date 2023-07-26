package com.chat.common.core.controller;

import com.chat.common.config.RedisKeyConfig;
import com.chat.common.constant.HttpStatus;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.page.TableDataInfo;
import com.chat.common.core.redis.RedisCache;
import com.chat.common.filter.AppLoginHolder;
import com.chat.common.utils.StringUtils;
import com.chat.common.utils.spring.SpringUtils;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;

import java.util.List;

/**
 * web层通用数据处理
 *
 * @author chat
 */
public class APPController {

    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 获取登录用户名
     */
    public Integer getUserId() {
        String token = AppLoginHolder.getUser();
        Assert.isTrue(StringUtils.isNotEmpty(token), "缺少token");
        RedisCache redisCache = SpringUtils.getBean("redisCache");
        Integer phone = redisCache.getCacheObject(RedisKeyConfig.appUser + token);
        Assert.isTrue(phone != null, "授权失败，请重新登录");
        return phone;
    }

    /**
     * 获取token
     */
    public String getToken() {
        String token = AppLoginHolder.getUser();
        Assert.isTrue(StringUtils.isNotEmpty(token), "缺少token");
        return token;
    }

    /**
     * 响应请求分页数据
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * 返回成功
     */
    public AjaxResult success() {
        return AjaxResult.success();
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error() {
        return AjaxResult.error();
    }

    /**
     * 返回成功消息
     */
    public AjaxResult success(String message) {
        return AjaxResult.success(message);
    }

    /**
     * 返回成功消息
     */
    public AjaxResult success(Object data) {
        return AjaxResult.success(data);
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error(String message) {
        return AjaxResult.error(message);
    }

    /**
     * 返回警告消息
     */
    public AjaxResult warn(String message) {
        return AjaxResult.warn(message);
    }

    /**
     * 响应返回结果
     *
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows) {
        return rows > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 响应返回结果
     *
     * @param result 结果
     * @return 操作结果
     */
    protected AjaxResult toAjax(boolean result) {
        return result ? success() : error();
    }

    /**
     * 页面跳转
     */
    public String redirect(String url) {
        return StringUtils.format("redirect:{}", url);
    }
}
