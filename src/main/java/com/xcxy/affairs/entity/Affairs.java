package com.xcxy.affairs.entity;

import java.util.Date;

public class Affairs {
	/*编号*/
	private int aNum;
	/*类型*/
	private String aType;
	/*部门编号*/
	private String aDnum;
	/*部门名称*/
	private String aDname;
	/*申请员工编号——招聘时用作联系人电话号码*/
	private String aWnum;
	/*申请员工姓名——招聘时用作联系人姓名——公告时用作发布者姓名*/
	private String aWname;
	/*申请职位——招聘时用作招聘职位*/
	private String aPname;
	/*内容——招聘时用作存储薪资待遇——公告时用作公告内容*/
	private String aContent;
	/*状态*/
	private String aState;
	/*创建时间*/
	private Date aTime;
	public String getaDname() {
		return aDname;
	}
	public void setaDname(String aDname) {
		this.aDname = aDname;
	}
	public String getaPname() {
		return aPname;
	}
	public void setaPname(String aPname) {
		this.aPname = aPname;
	}
	
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public String getaState() {
		return aState;
	}
	public void setaState(String aState) {
		this.aState = aState;
	}
	public String getaType() {
		return aType;
	}
	public void setaType(String aType) {
		this.aType = aType;
	}
	public String getaDnum() {
		return aDnum;
	}
	public void setaDnum(String aDnum) {
		this.aDnum = aDnum;
	}
	public String getaWnum() {
		return aWnum;
	}
	public void setaWnum(String aWnum) {
		this.aWnum = aWnum;
	}
	public String getaWname() {
		return aWname;
	}
	public void setaWname(String aWname) {
		this.aWname = aWname;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public Date getaTime() {
		return aTime;
	}
	public void setaTime(Date aTime) {
		this.aTime = aTime;
	}

}
