package com.chat.common.filter;

/**
 * 获取APP的token
 */
public class AppLoginHolder {
    private AppLoginHolder() {
    }

    private static ThreadLocal<String> loginUser = new InheritableThreadLocal<>();

    /**
     * 获取当前登录用户
     */
    public static String getUser() {
        return loginUser.get();
    }

    public static void bind(String user) {
        loginUser.set(user);
    }

    public static void remove() {
        loginUser.remove();
    }

}
