package com.parsley.test;

import com.parsley.utils.ProduceMD5;

public class MD5Test {

    public static void main(String[] args) {
        String s = "user123";
        System.out.println(ProduceMD5.getMD5(s));
    }
}
