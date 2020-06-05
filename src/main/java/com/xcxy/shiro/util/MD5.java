package com.xcxy.shiro.util;

import org.apache.shiro.crypto.hash.SimpleHash;

/**
 * 加密工具类
 * @author john
 *
 */
public class MD5 {
	//加密类型
	private static String hashName="MD5";
	//加密次数
	private static int hashNum=1024;
	public static Object getMD5(String pwd,String salt){
		Object obj=new SimpleHash(hashName, pwd, salt, hashNum);
		return obj;
		
	}

}
