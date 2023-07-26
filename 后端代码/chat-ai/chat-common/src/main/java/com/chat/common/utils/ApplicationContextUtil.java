package com.chat.common.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import java.lang.annotation.Annotation;
import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author create by qinjinjin
 * @version v1.0
 * @date 2022年6月18日
 */
@Component
public class ApplicationContextUtil implements ApplicationContextAware {

    private static ApplicationContext context;

    @Override
    public void setApplicationContext(@NonNull ApplicationContext applicationContext) {
        // 注入上下文对象
        setFactory(applicationContext);
    }
    private static void setFactory(ApplicationContext context) {
        ApplicationContextUtil.context = context;
    }
    public static <T> T getBean(Class<T> clazz) {
        T result = null;
        if(context != null) {
            result = context.getBean(clazz);
        }
        return result;
    }
    public static <T> Map<String,T> getBeansOfType(Class<T> clazz) {
        Map<String,T> result = null;
        if(context != null) {
            result = context.getBeansOfType(clazz);
        }
        return result;
    }
    
    public static Object getBean(String beanId) {
        Object result = null;
        if(context != null) {
            result = context.getBean(beanId);
        }
        return result;
    }

    public static <T> T getBean(String beanName, Class<T> requiredType) {
        T result = null;
        if(context != null) {
            result = context.getBean(beanName, requiredType);
        }
        return result;
    }

    public static Map<String, Object> getBeansWithAnnotation(Class<? extends Annotation> annotationTag){
        Map<String, Object> result = new HashMap<>(16);
        if(context != null) {
            result = context.getBeansWithAnnotation(annotationTag);
        }
        return result;
    }
}
