package com.chat.common.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HTMLLinkExtractor {
    private static final String HTML_LINK_REGEX = "<img\\s+(?:[^>]*?\\s+)?src=\"([^\"]*)\"";

    public static void extractLinks(String html) {
        Pattern pattern = Pattern.compile(HTML_LINK_REGEX);
        Matcher matcher = pattern.matcher(html);

        while (matcher.find()) {
            String link = matcher.group(1);
            System.out.println(link);
        }
    }

    public static void main(String[] args) {
        String html = "<p><img src=\"/prod-api/profile/upload/2023/07/22/96145773074beeb63492237f9c469e3b_20230722194030A001.jpg\"></p><p><img src=\"/prod-api/profile/upload/2023/07/28/600_20230728145507A001.jpg\"></p>";
        extractLinks(html);
        getChinese();
    }

    public static void getChinese() {
        String text = "Hello 你好！This is a test 文本。";

        // 使用正则表达式匹配汉字
        Pattern pattern = Pattern.compile("[\u4e00-\u9fa5]");
        Matcher matcher = pattern.matcher(text);
        StringBuilder stringBuilder = new StringBuilder();

        // 迭代匹配结果
        while (matcher.find()) {
            String chineseCharacter = matcher.group();
            // 输出每个汉字
            stringBuilder.append(chineseCharacter);
        }
        System.out.println(stringBuilder.toString());
    }
}