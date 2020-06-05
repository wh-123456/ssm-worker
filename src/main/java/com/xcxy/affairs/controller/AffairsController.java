package com.xcxy.affairs.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xcxy.affairs.entity.Affairs;
import com.xcxy.affairs.service.Impl.AffairsServiceImpl;
import com.xcxy.department.entity.Department;
import com.xcxy.department.service.Impl.DepartmentServiceImpl;
import com.xcxy.money.entity.Money;
import com.xcxy.money.service.Impl.MoneyServiceImpl;

@Controller
@CrossOrigin //实现当前类所有方法可跨域访问
@RequestMapping("/affairs")
public class AffairsController {
	@Autowired
	private AffairsServiceImpl asImpl;
	@Autowired
	private DepartmentServiceImpl deImpl;
	@Autowired
	private MoneyServiceImpl monImpl;
	

	
	/**
	 * 添加事务
	 */
	@PostMapping("/addAffairs")
	@ResponseBody
	public int addAffairs(Affairs a){
		a.setaTime(new Date());
		int num=asImpl.addAffairs(a);
		return num;
	}
	/**
	 * 跳转到事务请求界面
	 * 根据员工编号查询员工提交的事务
	 */
	@RequestMapping("/selectpracticeByNum")
	public String selectpracticeByNum(String wNum,HttpServletRequest request){
		Affairs a=asImpl.selectpracticeByNum(wNum);
		request.getSession().setAttribute("aff", a);
		return "affairs/promotion";
	}
	/**
	 * 跳转到公告管理界面
	 */
	@RequestMapping("/departmentnotice")
	public String godepartmentNotice(String dNum,HttpServletRequest request){
		Affairs a=new Affairs();
		a.setaDnum(dNum);
		List<Affairs> as=asImpl.selectMynotice(a);
		request.getSession().setAttribute("myNotice", as);
		return "affairs/departmentNotice";
	}
	/**
	 * 跳转到事务管理界面
	 * 根据部门编号将该部门所有事务发送给主管
	 */
	@RequestMapping("/bossPromotion")
	public String bossPromotion(String dNum,HttpServletRequest request){
		List<Affairs> as=asImpl.selectBosspromotionBydNum(dNum);
		request.getSession().setAttribute("as", as);
		return "affairs/bossPromotion";
	}
	/**
	 * 跳转到招聘信息界面
	 */
	@RequestMapping("/recruitsList")
	public String gorecruits(HttpServletRequest request){
		List<Affairs> as=asImpl.getrecruitList();
		request.getSession().setAttribute("affs", as);
		//获取到所有部门信息
		List<Department> ds=deImpl.finddepartment();
		request.getSession().setAttribute("departs", ds);
		return "affairs/recruit";
	}
	/**
	 * 获取所有关于招聘的信息
	 */
	@RequestMapping("/getrecruitInfo")
	@ResponseBody
	public List<Affairs> getrecruitList(){
		List<Affairs> as=asImpl.getrecruitList();
		return as;
	}
	/**
	 * 发布招聘信息
	 */
	@PostMapping("/addrecruit")
	@ResponseBody
	public int adddrecuit(Money m,Affairs a){
		Money money=monImpl.findMoneyList(m).get(0);
		if(money.getmMin()==null){
			a.setaContent("面议");
		}else 
		if(money.getmSafe()==null){
			a.setaContent(money.getmMin()+"-"+money.getmMax());
		}else{
			a.setaContent(money.getmMin()+"-"+money.getmMax()+",   "+money.getmSafe());
		}
		a.setaType("招聘");
		a.setaTime(new Date());
		int num=asImpl.addAffairs(a);
		return num;
	}
	/**
	 * 根据部门编号获取该部门发布的招聘信息职位
	 */
	@PostMapping("/getrecruitPnameBydNum")
	@ResponseBody
	public String[] getrecruitPnameBydNum(String dNum){
		List<Affairs> as=asImpl.getrecruitPnameBydNum(dNum);
		String[] dNums=new String[as.size()];
		for(int i=0;i<as.size();i++){
			dNums[i]=as.get(i).getaPname();
		}
		return dNums;
	}
	/**
	 * 根据部门编号查询公告
	 */
	@PostMapping("/selectnoticeByDnum")
	@ResponseBody
	public List<Affairs> selectnoticeByDnum(Affairs a){
		List<Affairs> as=asImpl.selectnoticeByDnum(a);
		return as;
	}
	/**
	 * 查看自己发布的公告
	 */
	@PostMapping("/selectMynotice")
	@ResponseBody
	 public List<Affairs> selectMynotice(Affairs a){
	  List<Affairs> as=asImpl.selectMynotice(a);
	  return as;
	}
	/**
	 * 删除事务——根据员工编号删除职位变更事务
	 */
	@PostMapping("/deletepracticeByNum")
	@ResponseBody
	public int deletepracticeByNum(String wNum){
		int num=asImpl.deletepracticeByNum(wNum);
		return num;
	}
	/**
	 * 删除事务——根据事务Id删除事务
	 */
	@PostMapping("/deletepracticeById")
	@ResponseBody
	public int deletepracticeById(int id){
		int num=asImpl.deletepracticeById(id);
		return num;
	}
	/**
	 * 审核结果为同意
	 */
	@PostMapping("/argeePromotion")
	@ResponseBody
	public int argee(String wNum){
		int num=asImpl.argeepromotion(wNum);
		return num;
	}
	/**
	 * 审核结果为不同意
	 */
	@PostMapping("/noargeePromotion")
	@ResponseBody
	public int noargee(String wNum){
		int num=asImpl.noargeePromotion(wNum);
		return num;
	}
	
}
