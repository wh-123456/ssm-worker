package com.xcxy.worker.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xcxy.department.entity.Department;
import com.xcxy.department.service.Impl.DepartmentServiceImpl;
import com.xcxy.money.entity.History;
import com.xcxy.money.service.Impl.MoneyServiceImpl;
import com.xcxy.user.entity.User;
import com.xcxy.user.service.Impl.UserServiceImpl;
import com.xcxy.worker.entity.Worker;
import com.xcxy.worker.entity.WorkerInfo;
import com.xcxy.worker.service.impl.WorkerServiceImpl;

@Controller
@CrossOrigin(origins = "*", maxAge = 3600) //实现当前类所有方法可跨域访问
@RequestMapping("/worker")
public class WorkerController {
	@Autowired
	private WorkerServiceImpl wsImpl;
	@Autowired
	private DepartmentServiceImpl deImpl;
	@Autowired
	private MoneyServiceImpl monImpl;
	@Autowired
	private UserServiceImpl userImpl;
	
	/**
	 * 员工列表增
	 */
	@RequestMapping(value="addworker",method=RequestMethod.POST)
	@ResponseBody
	public int addworker(Worker w){
		int num=wsImpl.addWorker(w);
		return num;
	}
	/**
	 * 员工表删
	 * 删除员工时同时删除对应的员工信息表
	 */
	@RequestMapping("/deleteworker")
	@ResponseBody
	public int deleteWorkerById(String wNum){
		int num=wsImpl.deleteWorkerById(wNum);
		wsImpl.deleteworkerInfoById(wNum);
		/*删除对应注册账号*/
		userImpl.deleteUserByNum(wNum);
		return num;
	}
	/**
	 * 员工表批量删除
	 */
	@PostMapping("/deleteWorkerSome")
	@ResponseBody
	public int deleteWorkerSome(String nums){
		String[] ns=nums.split(",");
		List<String> wNums=new ArrayList<String>();
		for(int i=0;i<ns.length;i++){
			wNums.add(ns[i]);
		}
		int num=wsImpl.deleteWorkerSome(wNums);
		/*删除对应的员工信息*/
		wsImpl.deleteworkerInfoSome(wNums);
		/*删除账号*/
		userImpl.deleteUserSome(wNums);
		return num;
	}
	/**
	 * 员工表改
	 */
	@RequestMapping(value="updateworker",method=RequestMethod.POST)
	@ResponseBody
	public int updateworkerById(Worker w){
		//更改员工编号时和性别时，会更改对应信息表得员工编号和性别
		if(w.getNewWnum()!=null||w.getwSex()!=null){
			WorkerInfo wi=new WorkerInfo();
			wi.setWiNum(w.getwNum());
			wi.setNewWinum(w.getNewWnum());
			wi.setWiSex(w.getwSex());
			wsImpl.updateworkerInfoById(wi);
		}
		/*更改用户表角色ID*/
		User u=new User();
		u.setuWnum(w.getwDnum());
		if(w.getwPname()=="主管"){
			u.setFkRoId(2);
		}else{
			u.setFkRoId(3);
		}
		userImpl.updateUserrId(u);
		int num=wsImpl.updateworkerById(w);
		return num;
		
	}
	
	/**
	 * 员工列表显示
	 */
	@RequestMapping("/workerListByNum")
	public String findWorkerByNum(Worker w,@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request){
		List<Department> ds=deImpl.finddepartment();
		request.getSession().setAttribute("ds", ds);
		PageHelper.startPage(page, 5);
		List<Worker> ws=wsImpl.findWorkerByNum(w);
		request.getSession().setAttribute("ws", ws);
		PageInfo<Worker> p=new PageInfo<Worker>(ws);
		request.getSession().setAttribute("page", p);
		request.getSession().setAttribute("parameter", "workerListByNum?wDnum="+w.getwDnum());
		request.getSession().setAttribute("dNum",w.getwDnum());
		return "worker/workerList";
		
	}
	/**
	 * 获取所有员工编号(包括实习生编号)——新增遍历查重
	 */
	@RequestMapping(value="selectwNumList",method=RequestMethod.POST)
	@ResponseBody
	public String[] selectwNumList(){
		List<Worker> ws=wsImpl.findWorkerListAll();
		String[] nums=new String[2*ws.size()];
		for(int i=0;i<ws.size();i++){
			nums[i]=ws.get(i).getwNum();
		}
		for(int i=0;i<ws.size();i++){
			nums[i+ws.size()]=ws.get(i).getwName();
		}
		return nums;
	}
	/**
	 * 员工模糊查询，根据姓名或者员工编号
	 */
	@RequestMapping("/selectworkerList2")
	public String findWorkerByNameOrNum2(Worker w,@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request){
		request.getSession().setAttribute("parameter", "selectworkerList2?wName="+w.getwName()+"&wDnum="+w.getwDnum());
		List<Department> ds=deImpl.finddepartment();
		request.getSession().setAttribute("ds", ds);
		PageHelper.startPage(page, 5);
		w.setwName("%"+w.getwName()+"%");
		List<Worker> ws=wsImpl.findWorkerByNameOrNum2(w);
		request.getSession().setAttribute("ws", ws);
		PageInfo<Worker> p=new PageInfo<Worker>(ws);
		request.getSession().setAttribute("page", p);
		return "worker/workerList";
		}
	/**
	 * 员工精准查询——根据员工编号
	 */
	@RequestMapping("/selectWorkerbywNum")
	@ResponseBody
	public Worker selectWorkerbywNum(String wNum){
		Worker w=wsImpl.selectWorkerbywNum(wNum);
		return w;
	}
	/**
	 * 跳转到员工信息表增页面
	 */
	@RequestMapping("/intoaddworkerInfo")
	public String intoaddworkerInfo(WorkerInfo wi,String url,HttpServletRequest request){
		request.getSession().setAttribute("wi",wi);
		//获取到上一个url
		if(url==null){
		 url=request.getHeader("Referer");
		}
		request.getSession().setAttribute("url",url);
		return "worker/addworkerInfo";
	}
	/**
	 * 员工信息表增
	 */
	@RequestMapping(value="addworkerInfo",method=RequestMethod.POST)
	@ResponseBody
	public int addworkerInfo(WorkerInfo wi){
		int num=wsImpl.addworkerInfo(wi);
		return num;
	}
	/**
	 * 员工信息表删
	 */
	@RequestMapping("/deleteworkerInfo")
	@ResponseBody
	public int deleteworkerInfoById(String wiNum){
		int num=wsImpl.deleteworkerInfoById(wiNum);
		return num;
	}
	/**
	 * 员工信息表批量删
	 */
	@RequestMapping("/deleteworkerInfoSome")
	@ResponseBody
	public int deleteworkerInfoSome(List nums){
		int num=wsImpl.deleteworkerInfoSome(nums);
		return num;
	}
	/**
	 * 员工信息表改
	 */
	@RequestMapping(value="updateworkerInfo",method=RequestMethod.POST)
	@ResponseBody
	public int updateworkerInfoById(WorkerInfo wi){
		Worker w=new Worker();
		w.setwNum(wi.getWiNum());
		w.setwName(wi.getWiName());
		w.setwSex(wi.getWiSex());
		wsImpl.updateworkerById(w);
		int num=wsImpl.updateworkerInfoById(wi);
		return num;
	}
	/**
	 * 员工信息列表
	 */
	@RequestMapping("/findWorkerInfoByDnum")
	public String findWorkerInfoByDnum(WorkerInfo wi,@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request){
		PageHelper.startPage(page, 1);
		List<WorkerInfo> wis=wsImpl.findWorkerInfoByDnum(wi);
		request.getSession().setAttribute("wis", wis);
		PageInfo<WorkerInfo> p=new PageInfo<WorkerInfo>(wis);
		request.getSession().setAttribute("page", p);
		request.getSession().setAttribute("parameter", "worker/findWorkerInfoByDnum?wiDnum="+wi.getWiDnum()+"&wiNum="+wi.getWiNum());	
		return "worker/workerInfoList";
	}
	
	/**
	 * 根据员工姓名或者员工编号查询员工信息——最高权限
	 */
	@RequestMapping("/findWorkerInfoByIdOrName")
	public String findWorkerInfoByIdOrName(WorkerInfo wi,@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request){
		request.getSession().setAttribute("parameter", "worker/findWorkerInfoByIdOrName?wiDnum="+wi.getWiDnum()+"&wiName="+wi.getWiName());
		PageHelper.startPage(page, 1);
		wi.setWiName("%"+wi.getWiName()+"%");
		List<WorkerInfo> wis=wsImpl.findWorkerInfoByIdOrName(wi);
		request.getSession().setAttribute("wis", wis);
		PageInfo<WorkerInfo> p=new PageInfo<WorkerInfo>(wis);
		request.getSession().setAttribute("page", p);
		return "worker/workerInfoList";
	}
	/**
	 * 精准查询——查询某位员工的信息
	 */
	@RequestMapping("/findWorkerInfoById")
	public String findWorkerInfoById(String wNum,String wName,String wSex,@RequestParam(required=true,defaultValue="1")Integer page,HttpServletRequest request){
		PageHelper.startPage(page, 1);
		List<WorkerInfo> wis=wsImpl.findWorkerInfoById(wNum);
		request.getSession().setAttribute("wis", wis);
		PageInfo<WorkerInfo> p=new PageInfo<WorkerInfo>(wis);
		request.getSession().setAttribute("page", p);
		request.getSession().setAttribute("parameter", "worker/findWorkerInfoById?wNum="+wNum+"&wName="+wName+"&wSex="+wSex);
		request.getSession().setAttribute("wName",wName);
		request.getSession().setAttribute("wSex",wSex);
		request.getSession().setAttribute("wNum",wNum);
		//获取到上一个url
		String url=request.getHeader("Referer");
		request.getSession().setAttribute("url",url);
		return "worker/workerInfoList";
	}
	/**
	 * 根据员工编号查询某位员工
	 */
	@RequestMapping("/selectWorkerByNum")
	@ResponseBody
	public WorkerInfo selectWorkerByNum(String wNum){
		List<WorkerInfo> wis=wsImpl.findWorkerInfoById(wNum);
		WorkerInfo wi=wis.get(0);	
		return wi;
	}
	/**
	 * 获取所有普通员工
	 */
	@PostMapping("/getpeopleList")
	@ResponseBody
	public List<Worker> getpeopleList(){
		List<Worker> ws=wsImpl.getpeopleList();
		return ws;
	}
	/**
	 * 获取所有部门主管列表
	 */
	@PostMapping("/getBossList")
	@ResponseBody
	public List<Worker> getBossList(){
		List<Worker> ws=wsImpl.getBossList();
		return ws;
	}
	/**
	 * 上传员工头像
	 */
	@PostMapping("/upload")
	@ResponseBody
	public int testupload(@RequestParam("uploadfile") MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
        if(!file.isEmpty()) {
        	//上传文件路径
        	String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
        	String path = classpath.replaceAll("WEB-INF/classes/", "")/*后面部分是工程文件目录*/+"static/images/userImage/";
            //上传文件名
            //String filename = file.getOriginalFilename();
            //获取登录用户员工编号
            String filename=path+(String) request.getSession().getAttribute("userwNum")+".jpg";
            File filepath = new File(filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            //上传
            file.transferTo(filepath);
            return 1;
        } else {
            return 0;
        }
    }
}
