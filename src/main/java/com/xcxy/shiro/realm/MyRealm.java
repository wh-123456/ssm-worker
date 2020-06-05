package com.xcxy.shiro.realm;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.xcxy.user.dao.UserMapper;
import com.xcxy.user.entity.Role;
import com.xcxy.user.entity.User;

public class MyRealm extends AuthorizingRealm{
	@Autowired
	private UserMapper usermapper;
	
	/**
	 * 
	 * 授权方法
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 1. 从PrincipalCollection中来获取登陆用户的信息
		Object principal = principals.getPrimaryPrincipal();
		System.out.println("当前登陆的用户:"+principal);
		// 2. 利用登陆的用户信息来获取用户当前的角色以及权限(可能查询数据库)	
		Set<String> set = new HashSet<String>();
        //查询User通过账号
		User user = usermapper.findUserByUserName((String)principal);
		System.out.println(user+"*********");
		//得到User对应的角色
		Role role = user.getRole();
		//将角色放进集合中
		set.add(role.getrName());		
		System.out.println("set里的值:"+set);
		// 3. 创建SimpleAuthorizationInfo,并设置其reles属性
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addRoles(set);
		// 4. 返回SimpleAuthorizationInfo对象
		return simpleAuthorizationInfo;
	}

	/**
	 * 认证方法
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		// 从token拿到用户名
		String userName = (String) token.getPrincipal();
		//通过用户名去数据库查询
		System.out.println("============================="+userName);
		User user=usermapper.findUserByUserName(userName);
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		//发送用户名-main页面欢迎xx登录
		session.setAttribute("username", user.getuName());
		// 获取盐，通常用账号
		ByteSource credentialsSalt = ByteSource.Util.bytes(userName);
		// 盐值加密——密码不易被破解
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(userName,user.getuPassword(),credentialsSalt,getName());
		// SimpleAuthenticationInfo simpleAuthenticationInfo = new
		// SimpleAuthenticationInfo(user,
		// "64c8b1e43d8ba3115ab40bcea57f010b",getName());
		return simpleAuthenticationInfo;
	}

}
