package com.xcxy.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xcxy.shiro.util.MD5;
import com.xcxy.user.dao.UserMapper;
import com.xcxy.user.entity.User;
import com.xcxy.user.service.Impl.UserServiceImpl;
import com.xcxy.worker.dao.WorkerMapper;
import com.xcxy.worker.entity.Worker;
import com.xcxy.worker.entity.WorkerInfo;
@RequestMapping("/user")
@CrossOrigin //实现当前类所有方法可跨域访问
@Controller
public class UserController {
	@Autowired
	private UserMapper um;
	@Autowired
	private WorkerMapper wm;
	/**
	 * 获取所有注册过的员工编号
	 */
	@RequestMapping("/userList")
	@ResponseBody
	public String[] userList(){
		List<User> us=um.userList();
		String[] uWnums=new String[us.size()];
		for(int i=0;i<us.size();i++){
			uWnums[i]=us.get(i).getuWnum();
		}
		return uWnums;
	}
	/**
	 * 员工注册
	 */
	@RequestMapping(value="addUser",method=RequestMethod.POST )
	@ResponseBody
	public int addUser(User u){
		Object obj=MD5.getMD5(u.getuPassword(), u.getuName());
		String password=obj.toString();
		u.setuPassword(password);
		int num=um.addUser(u);
		return num;
	}
	/**
	 * 修改密码
	 */
	@RequestMapping("/updatePasswordBywNum")
	@ResponseBody
	public int updatePasswordBywNum(User u,HttpServletRequest request){
		String password=MD5.getMD5(u.getuPassword(), u.getuName()).toString();
		u.setuPassword(password);
		int num=um.updatePasswordBywNum(u);
		return num;
	}
	
	/**
	 * 跳转到找回密码页面
	 */
	@RequestMapping("/getPassword")
	public String getPassword(){
		return "system/getPassword";
	}
	/**
	 * 密码找回
	 */
	@PostMapping("/getNewPassword")
	@ResponseBody
	public int getNewPassword(String wNum,String username,String wName,String newPassword){
		//先根据传输过来的员工编号获取用户信息
		User u=um.getUserInfoByNum(wNum);
		//根据员工编号获取员工信息
		WorkerInfo wi=wm.findWorkerInfoById(wNum).get(0);
		int num=0;
		//验证用户名和姓名
		if(username.equals(u.getuName())&&wName.equals(wi.getWiName())){
			String password=MD5.getMD5(newPassword, username).toString();
			u.setuPassword(password);
			num=um.updatePasswordBywNum(u);
		}
		return num;
	}
	/**
	 * 根据用户名和密码获取外键——用户身份判断
	 */
	@RequestMapping("/getUserAll")
	@ResponseBody
	public User getUserRoleId(User u){
		User user=um.getUserRoleId(u);
		
		return user;
	}
	/**
	 * 跳转到账号管理页面
	 */
	@RequestMapping("/gotoUserInfo")
	public String goUserInfo(){
		return "system/userInfo";
	}
	/**
	 * 根据员工编号获取用户信息
	 */
	@RequestMapping("/getUserInfoByNum")
	@ResponseBody
	public User getUserInfoByNum(String wNum){
		User u=um.getUserInfoByNum(wNum);
		return u;
	}
	/**
	 * 删除用户
	 */
	@RequestMapping("deleteUserByNum")
	@ResponseBody
	public int deleteUserByNum(String wNum){
		int num=um.deleteUserByNum(wNum);
		return num;
	}
	/**
	 * 批量删除用户
	 */
	@RequestMapping("/deleteUserSome")
	@ResponseBody
	public int deleteUserSome(List wNums){
		int num=um.deleteUserSome(wNums);
		return num;
	}
	/**
	 * 删除一个部门所有用户
	 */
	@RequestMapping("/deleteUserByDnum")
	@ResponseBody
	public int deleteUserByDnum(String dNum){
		int num=um.deleteUserByDnum(dNum);
		return num;
	}
	/**
	 * 更改用户角色ID
	 */
	@RequestMapping("/updateUserrId")
	@ResponseBody
	public int updateUserrId(User u){
		int num=um.updateUserrId(u);
		return num;
	}
}
