package com.xcxy.shiro.util;

import org.apache.commons.codec.binary.Base64;

public class Base64Utils {
    /**
     * 加密
     *
     * @param plainText
     * @return
     */
    public static String encodeStr(String plainText) {
        byte[] b = plainText.getBytes();
        Base64 base64 = new Base64();
        b = base64.encode(b);
        return new String(b);
    }

    /**
     * 解密
     *
     * @param encodeStr
     * @return
     */
    public static String decodeStr(String encodeStr) {
        byte[] b = encodeStr.getBytes();
        Base64 base64 = new Base64();
        b = base64.decode(b);
        return new String(b);
    }
    
}
