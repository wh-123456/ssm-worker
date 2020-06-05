package com.xcxy.user.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxy.user.dao.UserMapper;
import com.xcxy.user.entity.Menu;
import com.xcxy.user.entity.User;
import com.xcxy.user.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper um;
	@Override
	public User findUserByUserName(String uName) {
		User u=um.findUserByUserName(uName);
		return u;
	}
	@Override
	public List<User> userList() {
		List<User> us=um.userList();
		return us;
	}
	@Override
	public int addUser(User u) {
		int num=um.addUser(u);
		return num;
	}
	@Override
	public User getUserRoleId(User u) {
		User user=um.getUserRoleId(u);
		return user;
	}
	@Override
	public int updatePasswordBywNum(User u) {
		int num=um.updatePasswordBywNum(u);
		return num;
	}
	@Override
	public User getUserInfoByNum(String wNum) {
		User u=um.getUserInfoByNum(wNum);
		return u;
	}
	@Override
	public int deleteUserByNum(String wNum) {
		int num=um.deleteUserByNum(wNum);
		return num;
	}
	@Override
	public int deleteUserSome(List wNums) {
		int num=um.deleteUserSome(wNums);
		return num;
	}
	@Override
	public int deleteUserByDnum(String dNum) {
		int num=um.deleteUserByDnum(dNum);
		return num;
	}
	@Override
	public int updateUserrId(User u) {
		int num=um.updateUserrId(u);
		return num;
	}
	

}
