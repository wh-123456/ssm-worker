package com.xcxy.shiro.Test;

import com.xcxy.shiro.util.Base64Utils;

public class TestBase64 {
	public static void main(String[] args) {
		/*加密测试*/
    	System.out.println("加密测试："+Base64Utils.encodeStr("6415123465483526"));
    	System.out.println("6415 1234 6548 3526".length());
    	/*解密测试*/
    	System.out.println("解密测试："+Base64Utils.decodeStr("d2ggMTIzIDQ1Ng=="));
	}
}
