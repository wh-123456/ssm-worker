package com.xcxy.resume.controller;

import java.util.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xcxy.practice.entity.Practice;
import com.xcxy.resume.dao.ResumeMapper;
import com.xcxy.resume.entity.Resume;
import com.xcxy.worker.entity.Worker;
@Controller
@CrossOrigin //实现当前类所有方法可跨域访问
@RequestMapping("/resume")
public class ResumeController {
	@Autowired
	private ResumeMapper rm;
	/**
	 * 投简历
	 */
	@RequestMapping("/addresume")
	@ResponseBody
	public int addresume(Resume r){
		r.setrTime(new Date());
		int num=rm.addresume(r);
		return num;
	}
	/**
	 * 删除简历
	 */
	@PostMapping("/deleteresumeById")
	@ResponseBody
	public int deleteresumeById(Integer rId){
		int num=rm.deleteresumeById(rId);
		return num;
	}
	/**
	 * 录取简历
	 */
	@PostMapping("/setresumetopractice")
	@ResponseBody
	public int setresumetopractice(Practice p){
		int num=rm.setresumetopractice(p);
		/*录取后删除该简历*/
		rm.deleteresumeById(Integer.parseInt(p.getpDnum()));
		return num;
	}
	/**
	 * 主管根据部门编号查询本部门收到的简历
	 */
	@RequestMapping("/selectresumeBydNum")
	public String selectresumeBydNum(@RequestParam(required=true,defaultValue="1")Integer page,String dNum,HttpServletRequest request){
		PageHelper.startPage(page, 1);
		List<Resume> rs=rm.selectresumeBydNum(dNum);
		request.getSession().setAttribute("rs", rs);
		PageInfo<Resume> p=new PageInfo<Resume>(rs);
		request.getSession().setAttribute("page", p);
		request.getSession().setAttribute("resumes", "resume/selectresumeBydNum?dNum="+dNum);
		return "affairs/recruitList";
	}

}
