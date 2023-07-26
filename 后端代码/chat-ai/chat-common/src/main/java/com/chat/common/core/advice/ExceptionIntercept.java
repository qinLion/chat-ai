package com.chat.common.core.advice;

import com.chat.common.constant.HttpStatus;
import com.chat.common.core.domain.AjaxResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
@Order(0)
public class ExceptionIntercept {

//    /**
//     * 处理全局异常
//     */
//    @ExceptionHandler(Exception.class)
//    public AjaxResult handleException(Exception ex) {
//        log.error("stackTrace: ", ex);
//        return AjaxResult.error("系统繁忙，请稍后再试");
//    }

    /**
     * 不合法或不正确的参数 使用断言 Assert 抛出来
     */
    @ExceptionHandler({IllegalArgumentException.class})
    public AjaxResult handleIllegalArgumentException(IllegalArgumentException ex) {
        log.error("stackTrace: ", ex);
        if (ex.getMessage().equals("授权失败，请重新登录")) {
            return AjaxResult.error(HttpStatus.FORBIDDEN, ex.getMessage());
        }else {
            return AjaxResult.error(HttpStatus.ERROR, ex.getMessage());
        }
    }

}