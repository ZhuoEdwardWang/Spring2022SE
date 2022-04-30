package com.forum.util;

import org.springframework.util.DigestUtils;

public class MD5Util {

    private static final String salt = "M4mxf:He[=FMK&vE_44P";

    public static String getMD5(String pwd){
        String base = salt + '/' + pwd;
        System.out.println(base);
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }
}
