package com.xcxy.practice.entity;

import java.util.Date;

public class Practice {
	/*实习编号*/
	private String pNum;
	/*姓名*/
	private String pName;
	/*性别*/
	private String pSex;
	/*部门编号*/
	private String pDnum;
	/*毕业院校*/
	private String pSchool;
	/*学历*/
	private String pEducation;
	/*专业*/
	private String pSpeciality;
	/*实习开始时间*/
	private Date pStime;
	/*实习结束时间*/
	private Date pEtime;
	/*部门名称——他表查询*/
	private String pDname;
	@Override
	public String toString() {
		return "Practice [pNum=" + pNum + ", pName=" + pName + ", pSex=" + pSex + ", pDnum=" + pDnum + ", pSchool="
				+ pSchool + ", pEducation=" + pEducation + ", pSpeciality=" + pSpeciality + ", pStime=" + pStime
				+ ", pEtime=" + pEtime + ", pDname=" + pDname + "]";
	}
	public String getpNum() {
		return pNum;
	}
	public void setpNum(String pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpSex() {
		return pSex;
	}
	public void setpSex(String pSex) {
		this.pSex = pSex;
	}
	public String getpDnum() {
		return pDnum;
	}
	public void setpDnum(String pDnum) {
		this.pDnum = pDnum;
	}
	public String getpSchool() {
		return pSchool;
	}
	public void setpSchool(String pSchool) {
		this.pSchool = pSchool;
	}
	public String getpEducation() {
		return pEducation;
	}
	public void setpEducation(String pEducation) {
		this.pEducation = pEducation;
	}
	public String getpSpeciality() {
		return pSpeciality;
	}
	public void setpSpeciality(String pSpeciality) {
		this.pSpeciality = pSpeciality;
	}
	public Date getpStime() {
		return pStime;
	}
	public void setpStime(Date pStime) {
		this.pStime = pStime;
	}
	public Date getpEtime() {
		return pEtime;
	}
	public void setpEtime(Date pEtime) {
		this.pEtime = pEtime;
	}
	public String getpDname() {
		return pDname;
	}
	public void setpDname(String pDname) {
		this.pDname = pDname;
	}
	
}
