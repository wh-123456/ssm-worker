package com.xcxy.department.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.xcxy.money.entity.Money;
import com.xcxy.money.service.Impl.MoneyServiceImpl;
import com.xcxy.practice.service.Impl.PracticeServiceImpl;
import com.xcxy.user.service.Impl.UserServiceImpl;


@Controller
@RequestMapping("/department")
@CrossOrigin //实现跨域访问
public class DepartmentController {
	@Autowired
	DepartmentServiceImpl deImpl;
	@Autowired
	private MoneyServiceImpl monImpl;
	@Autowired
	private UserServiceImpl userImpl;
	@Autowired
	private PracticeServiceImpl practiceImpl;
	/**
	 * 部门新增
	 */
	@RequestMapping(value="addDepartment",method=RequestMethod.POST)
	@ResponseBody
	public int adddepartment(Department department){
		department.setdTime(new Date());
		int num=deImpl.adddepartment(department);
		//新增该部门固定职位：主管、职员
		Money m=new Money();
		m.setmDnum(department.getdNum());
		m.setmPname("主管");
		deImpl.addPnameByNum(m);
		m.setmPname("职员");
		deImpl.addPnameByNum(m);
		return num;
	}
	/**
	 * 部门职位新增
	 */
	@RequestMapping(value="addPnameByNum",method=RequestMethod.POST)
	@ResponseBody
	public int addPnameByNum(Money m){
		int num=deImpl.addPnameByNum(m);
		return num;
	}
	/**
	 * 部门解散
	 */
	@RequestMapping(value="deleteDepartment",method=RequestMethod.POST)
	@ResponseBody
	public int deleteDepartment(String dNum){
		/*删除该部门设置薪资*/
		monImpl.deleteMoneyByDnum(dNum);
		int num=deImpl.deleteDepartment(dNum);
		return num;
	}
	/**
	 * 解散一个部门的所有员工
	 */
	@RequestMapping(value="deleteDepartmentWorker",method=RequestMethod.POST)
	@ResponseBody
	public int deleteDepartmentWorker(String dNum){
		/*删除员工*/
		int num=deImpl.deleteDepartmentWorker(dNum);
		/*删除员工信息*/
		num+=deImpl.deleteDepartmentWorkerInfo(dNum);
		/*删除实习生*/
		practiceImpl.deletePracticeByDnum(dNum);
		/*删除该部门所有用户*/
		userImpl.deleteUserByDnum(dNum);
		return num;
	}
	/**
	 * 部门职位删除-此部门此职位的员工职位更改为职员
	 */
	@RequestMapping(value="deletePnameByNum",method=RequestMethod.POST)
	@ResponseBody
	public int deletePnameByNum(Money m){
		deImpl.updatePnameByNum(m);
		int num=deImpl.deletePnameByNum(m);
		return num;
	}
	/**
	 * 部门更改
	 * 当更改部门编号时会更改对应部门职员的部门编号
	 * 还有工资表部门编号
	 */
	@RequestMapping("/updateDepartment")
	@ResponseBody
	public int updatedepartment(Department department){
		int num=deImpl.updatedepartment(department);
		num+=deImpl.updateWokerDe(department);
		/*改部门实习生部门编号*/
		practiceImpl.updateallpracticeDnum(department);
		/*改工资表部门编号*/
		Money m=new Money();
		m.setNewmDnum(department.getNewdNum());
		m.setmDnum(department.getdNum());
		monImpl.updateMoneyDnum(m);
		return num;
	}
	/**
	 * 将部门里某职位的员工职位更改为职员
	 */
	@RequestMapping(value="updatePnameByNum",method=RequestMethod.POST)
	@ResponseBody
	public int updatePnameByNum(Money m){
		int num=deImpl.updatePnameByNum(m);
		return num;
	}
	/**
	 * 部门解散时，员工不开除
	 */
	@RequestMapping(value="updateWorkerDnum",method=RequestMethod.POST)
	@ResponseBody
	public int updateWorkerDnum(String dNum){
		/*将实习生移至待分配状态*/
		practiceImpl.updatepracticeToBydNum(dNum);
		/*将员工移至待分配状态*/
		int num=deImpl.updateWorkerDnum(dNum);
		return num;
	}
	/**
	 * 部门合并
	 */
	@RequestMapping(value="mergeDepartment",method=RequestMethod.POST)
	@ResponseBody
	public int mergeDepartment(@RequestParam(value="dNums[]")List<String> dNums,String newdNum,String dName){
		Department d=new Department();
		d.setdName(dName);
		d.setdNum(newdNum);
		d.setNewdNum(newdNum);
		d.setdTime(new Date());
		/*新增合并的部门*/
		int num=deImpl.adddepartment(d);
		//新增该部门固定职位：主管、职员
		Money m=new Money();
		m.setmDnum(newdNum);
		m.setmPname("主管");
		deImpl.addPnameByNum(m);
		m.setmPname("职员");
		deImpl.addPnameByNum(m);
		for (String dNum : dNums) {
			if(dNum!=""){
			/*删除合并前部门的薪资信息*/
			monImpl.deleteMoneyByDnum(dNum);
			d.setdNum(dNum);
			/*将合并前的部门主管更改为职员*/
			deImpl.updateWorkerBoss(dNum);
			/*修改该部门职员的部门编号*/
			deImpl.updateWokerDe(d);
			/*修改合并前部门实习生部门编号*/
			practiceImpl.updateallpracticeDnum(d);
			/*删除合并前的部门*/
			deImpl.deleteDepartment(dNum);
		
			}
		}
		/*任命合并的新部门主管——任命的主管必须不是其他部门主管*/
		//int num=deImpl.updateWorkerBoss2(w);
		return num;
	}
	/**
	 * 部门列表
	 */
	@RequestMapping("departmentList")
	public String finddepartment(Integer size/*查询条数*/,@RequestParam(required=true,defaultValue="1")Integer page/*页码*/,HttpServletRequest request){
		if(size==null){
			//如果未设置显示条数，默认为5
			size=5;
		}
		PageHelper.startPage(page, size);
		List<Department> des=deImpl.finddepartment();
		/*将分页查询后结果传递给jsp页面*/
		request.getSession().setAttribute("des", des);
		PageInfo<Department> p=new PageInfo<Department>(des);
		request.getSession().setAttribute("page", p);
		//将显示条数传递给前端页面，供页面跳转使用
		request.getSession().setAttribute("department","size="+size);
		return "department/departmentList";
	}
	/**
	 * 查询某一部门的所有职位
	 */
	@RequestMapping(value="selectpNameByNum",method=RequestMethod.POST)
	@ResponseBody
	public String[] selectpNameByNum(String dNum,HttpServletRequest request){
		List<Money> ms=deImpl.selectpNameByNum(dNum);
		List<String> p=new ArrayList<String>();
		for (Money m : ms) {
			p.add(m.getmPname());
		}
		String[] pNames=new String[p.size()];
		p.toArray(pNames);
		return pNames;
	}
	/**
	 * 查询一个部门的主管
	 */
	@RequestMapping(value="selectBossByDnum",method=RequestMethod.POST)
	@ResponseBody
	public int selectBossByDnum(String dNum){
		List<Department> ds=deImpl.selectBossByDnum(dNum);
		int num=ds.size();
		return num;
		
	}
	/**
	 * 获取所有已存在部门编号——正则匹配去重
	 */
	@RequestMapping(value="selectDnumAll",method=RequestMethod.POST)
	@ResponseBody
	public String[] selectDnumAll(){
		List<Department> des=deImpl.finddepartment();
		String[] dnums=new String[des.size()];
		for(int i=0;i<des.size();i++){
			dnums[i]=des.get(i).getdNum();
		}
		return dnums;
	}
	/**
	 * 获取所有已存在部门名称——正则匹配去重
	 */
	@RequestMapping(value="selectDnameAll",method=RequestMethod.POST)
	@ResponseBody
	public String[] selectDnameAll(){
		List<Department> des=deImpl.finddepartment();
		String[] dnames=new String[des.size()];
		for(int i=0;i<des.size();i++){
			dnames[i]=des.get(i).getdName();
		}
		return dnames;
	}

}
