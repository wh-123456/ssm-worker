package com.xcxy.shiro.Test;

import org.apache.shiro.crypto.hash.SimpleHash;

//获取盐值加密后的密码，然后存入数据库
public class TestMD5 {
	public static void main(String[] args) {
		/*登录用户名：sj，密码：123456*/
		Object obj=new SimpleHash("MD5", "123456", "sj", 1024);
		System.out.println(obj);
		/*登录用户名：ljy，密码：123456*/
	}

}
