package com.chat.common.utils;

import java.util.Date;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class RandomCode {

    public static String getRandom() {
        Random rand = new Random(new Date().getTime());
        int cnt = 26 * 2 + 10;
        char[] s = new char[6];
        for (int i = 0; i < 6; i++) {
            int v = rand.nextInt(cnt);
            if (v < 10)
                s[i] = (char) ('0' + v);
            else if (v < 36)
                s[i] = (char) (v - 10 + 'A');
            else
                s[i] = (char) (v - 36 + 'a');
        }
        return new String(s);
    }

    public static void main(String[] args) throws InterruptedException {
        Set<String> strings = new HashSet<>();
        for (int i = 0; i < 30000; i++) {
            Thread.sleep(1);
            strings.add(getRandom());
        }
        System.out.println(strings.size());
        System.out.println(strings);
    }

}
