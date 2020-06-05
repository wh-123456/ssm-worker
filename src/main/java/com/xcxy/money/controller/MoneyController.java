package com.xcxy.money.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xcxy.department.entity.Department;
import com.xcxy.department.service.Impl.DepartmentServiceImpl;
import com.xcxy.money.entity.Bank;
import com.xcxy.money.entity.History;
import com.xcxy.money.entity.Money;
import com.xcxy.money.service.Impl.MoneyServiceImpl;
import com.xcxy.shiro.util.Base64Utils;
import com.xcxy.worker.entity.Worker;
import com.xcxy.worker.service.impl.WorkerServiceImpl;
@RequestMapping("/money")
@CrossOrigin //实现当前类所有方法可跨域访问
@Controller
public class MoneyController {
	@Autowired
	private MoneyServiceImpl moneyImpl;
	@Autowired
	private DepartmentServiceImpl departmentImpl;
	@Autowired
	private WorkerServiceImpl worImpl;
	
	/**
	 * 工资列表
	 */
	@RequestMapping("/findMoneyList")
	public String findMoneyList(Money m,@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request){
		PageHelper.startPage(page,5);/*设置每页显示5条数据*/
		List<Money> ms=moneyImpl.findMoneyList(m);
		request.getSession().setAttribute("ms", ms);
		PageInfo<Money> p=new PageInfo<Money>(ms);
		request.getSession().setAttribute("page", p);
		request.getSession().setAttribute("mon", "mPname="+m.getmPname()+"&mDnum="+m.getmDnum());
		/*部门列表——用于查询*/
		List<Department> ds=departmentImpl.finddepartment();
		request.getSession().setAttribute("ds", ds);
		return "money/moneyList";
	}
	/**
	 * 改工资
	 */
	@RequestMapping(value="updateMoneyByDnumAndPname",method=RequestMethod.POST)
	@ResponseBody
	public int updateMoneyByDnumAndPname(Money m){
		int num=moneyImpl.updateMoneyByDnumAndPname(m);
		return num;
	}
	/**
	 * 改部门编号
	 */
	@PostMapping("updateMoneyDnum")
	@ResponseBody
	public int updateMoneyDnum(Money m){
		int num=moneyImpl.updateMoneyDnum(m);
		return num;
	}
	/**
	 * 根据员工编号，获取本月该员工能得到的工资
	 */
	@PostMapping(value="getfinallMoney",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String getfinallMoney(History history){
		try {
		/*根据员工编号查询到员工信息*/
		Worker w=worImpl.selectWorkerbywNum(history.gethNum());
		/*根据查询到的部门编号和职位得到基本工资*/
		Money m=new Money();
		if(w==null){
			return null;
		}
		m.setmDnum(w.getwDnum());
		m.setmPname(w.getwPname());
		List<Money> ms=moneyImpl.findMoneyList(m);
		m=ms.get(0);//这里如果获取不到就报错
			double finalMon=m.getmMin();//这里取的最低工资当作基本工资
			
			/*根据员工编号查询本月奖惩详情*/
			List<History> hs=moneyImpl.findHistoryByNum(history);
			/*遍历*/
			int late=0;//迟到
			int early=0;//早退
			int absenteeism=0;//旷工
			int bonus=0;//奖励
			int leave=0;//请假
			for (History h : hs) {
				/*计算工资*/
				finalMon+=(h.gethPercentage()*h.gethMoney());
				if(h.gethContent().equals("迟到")){
					late+=1;
				}else if(h.gethContent().equals("早退")){
					early+=1;
				}else if(h.gethContent().equals("旷工")){
					absenteeism+=1;
				}else if(h.gethContent().equals("请假")){
					leave+=1;
				}else{
					bonus+=1;
				}
			}
			/*如果是计算本月，就输出本月预计工资*/
			if(history.gethContent().equals("本月")){
			  return "本月请假"+leave+"次，迟到"+late+"次，早退"+early+"次，旷工"+absenteeism+"次，获得绩效提成"+bonus+"次，预计本月可获得工资"+finalMon;
			}
			return "累计请假"+leave+"次，迟到"+late+"次，早退"+early+"次，旷工"+absenteeism+"次，获得绩效提成"+bonus+"次";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "无固定工资";
		}
	}
	/**
	 * 根据员工编号查询本月员工奖惩详情
	 */
	@RequestMapping("/findHistoryByNum")
	public String findHistoryByNum(History h,HttpServletRequest request){
		/*输出查询到的记录*/
		List<History> hs=moneyImpl.findHistoryByNum(h);
		request.getSession().setAttribute("hiss", hs);
		/*根据员工编号查询到员工信息*/
		Worker w=worImpl.selectWorkerbywNum(h.gethNum());
		request.getSession().setAttribute("hw", w);
		/*输出查询的员工的编号*/
		request.getSession().setAttribute("selectNum", h.gethNum());
		/*获取计算后结果*/
		String val=this.getfinallMoney(h);
		request.getSession().setAttribute("hval", val);
		/*根据员工编号获取到银行卡信息*/
		Bank b=moneyImpl.selectBankBywNum(h.gethNum());
		request.getSession().setAttribute("bank", b);
		return "money/monthHistory";
	}
	/**
	 * 添加奖惩信息
	 */
	@PostMapping("/addHistoryByNum")
	@ResponseBody
	public int addHistoryByNum(History h){
		h.sethTime(new Date());
		int num=moneyImpl.addHistoryByNum(h);
		return num;
	}
	/**
	 * 根据员工编号查询查询银行卡信息
	 */
	@RequestMapping("selectBankBywNum")
	@ResponseBody
	public Bank selectBankBywNum(String wNum){
		Bank b=moneyImpl.selectBankBywNum(wNum);
		return b;
	}
	/**
	 * 添加银行卡
	 */
	@PostMapping("/addBank")
	@ResponseBody
	public int addBank(Bank b){
		int num=moneyImpl.addBank(b);
		return num;
	}
	/**
	 * 修改银行卡
	 */
	@PostMapping("/updateBank")
	@ResponseBody
	public int updatBank(Bank b){
		int num=moneyImpl.updatBank(b);
		return num;
	}
	/**
	 * 删除一个部门所有薪资记录
	 */
	@RequestMapping("/deleteMoneyByDnum")
	@ResponseBody
	public int deleteMoneyByDnum(String dNum){
		return 0;
	}
}
