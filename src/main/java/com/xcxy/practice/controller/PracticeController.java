package com.xcxy.practice.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xcxy.department.entity.Department;
import com.xcxy.department.service.Impl.DepartmentServiceImpl;
import com.xcxy.practice.entity.Practice;
import com.xcxy.practice.service.Impl.PracticeServiceImpl;
import com.xcxy.user.entity.User;
import com.xcxy.user.service.Impl.UserServiceImpl;
@RequestMapping("/practice")
@CrossOrigin //实现当前类所有方法可跨域访问
@Controller
public class PracticeController {
	@Autowired
	private PracticeServiceImpl practiceServiceImpl;
	@Autowired
	private DepartmentServiceImpl departmentImpl;
	@Autowired
	private UserServiceImpl userImpl;
	
	/**
	 * 实习员工列表
	 */
	@RequestMapping("/findpracticeList")
	public String findpracticeList(Practice p,@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request){
		request.getSession().setAttribute("pra","pDnum="+p.getpDnum()+"&pName="+p.getpName());
		if(p.getpName()==null||p.getpName().equals("null")){
			
		}
		else{
			System.out.println("=========================name========"+p.getpName());
			p.setpName("%"+p.getpName()+"%");
		}
		PageHelper.startPage(page, 5);
		List<Practice> ps=practiceServiceImpl.findpracticeList(p);
		request.getSession().setAttribute("ps", ps);
		PageInfo<Practice> pa=new PageInfo<Practice>(ps);
		request.getSession().setAttribute("page", pa);
		/*部门列表*/
		List<Department> ds=departmentImpl.finddepartment();
		request.getSession().setAttribute("ds", ds);
		return "practice/practiceList";
	}
	/**
	 * 根据实习编号查询某位实习生
	 */
	@RequestMapping(value="selectpracticeByNum", method=RequestMethod.POST)
	@ResponseBody
	public Practice selectpracticeByNum(String pNum){
		Practice p=practiceServiceImpl.selectpracticeByNum(pNum);
		return p;
	}
	/**
	 * 实习员工增
	 */
	@RequestMapping(value="addpractice",method=RequestMethod.POST)
	@ResponseBody
	public int addpractice(Practice p){
		p.setpStime(new Date());
		int num=practiceServiceImpl.addpractice(p);
		return num;
	}
	/**
	 * 实习员工删
	 */
	@RequestMapping(value="deletepractice",method=RequestMethod.POST)
	@ResponseBody
	public int deletepractice(String pNum){
		int num=practiceServiceImpl.deletepractice(pNum);
		/*账号删除*/
		userImpl.deleteUserByNum(pNum);
		return num;
	}
	/**
	 * 实习员工改
	 */
	@RequestMapping(value="updatepractice",method=RequestMethod.POST)
	@ResponseBody
	public int updatepractice(Practice p){
		int num=practiceServiceImpl.updatepractice(p);
		return num;
	}
	/**
	 * 实习员工转正
	 */
	@RequestMapping(value="insertpracticeToworker",method=RequestMethod.POST)
	@ResponseBody
	public int insertpracticeToworker(String pNum){
		int num=practiceServiceImpl.insertpracticeToworker(pNum);
		/*转正后在实习员工表删除该员工*/
		practiceServiceImpl.deletepractice(pNum);
		/*转正后更改用户表角色ID*/
		User u=new User();
		u.setFkRoId(3);
		u.setuWnum(pNum);
		userImpl.updateUserrId(u);
		return num;
	}
	/**
	 * 跳转到实习员工信息界面
	 */
	@RequestMapping("/intopracticeInfo")
	public String intopracticeInfo(String pNum,HttpServletRequest request){
		Practice p=practiceServiceImpl.selectpracticeByNum(pNum);
		request.getSession().setAttribute("pInfo", p);
		return "practice/practiceInfo";
	}
	/**
	 * 修改一个部门所有员工实习编号
	 */
	@RequestMapping("/updateallpracticeDnum")
	@ResponseBody
	public int updateallpracticeDnum(Department d){
		int num=practiceServiceImpl.updateallpracticeDnum(d);
		return num;
	}
	/**
	 * 将一个部门的职员改为待分配状态
	 */
	@RequestMapping("/updatepracticeToBydNum")
	@ResponseBody
	public int updatepracticeToBydNum(String dNum){
		int num=practiceServiceImpl.updatepracticeToBydNum(dNum);
		return num;
	}
	/**
	 * 删除一个部门的实习生
	 */
	@RequestMapping("/deletePracticeByDnum")
	@ResponseBody
	public int deletePracticeByDnum(String dNum){
		int num=practiceServiceImpl.deletePracticeByDnum(dNum);
		return num;
	}
}
