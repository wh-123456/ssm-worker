package com.xcxy.user.dao;

import java.util.List;

import com.xcxy.user.entity.User;

public interface UserMapper {
	User findUserByUserName(String uName);
	List<User> userList();
	int addUser(User u);
	int updatePasswordBywNum(User u);
	User getUserRoleId(User u);
	User getUserInfoByNum(String wNum);
	int deleteUserByNum(String wNum);
	int deleteUserSome(List wNums);
	int deleteUserByDnum(String dNum);
	public int updateUserrId(User u);
}
