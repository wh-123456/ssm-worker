package com.xcxy.worker.entity;

public class Worker {
	/*员工编号*/
	private String wNum;
	/*姓名*/
	private String wName;
	/*性别*/
	private String wSex;
	/*部门编号*/
	private String wDnum;
	/*职称*/
	private String wPname;
	/*新的员工编号*/
	private String newWnum;
	
	/*所属部门——他表获取*/
	private String department;
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getwNum() {
		return wNum;
	}
	public void setwNum(String wNum) {
		this.wNum = wNum;
	}
	public String getwName() {
		return wName;
	}
	public void setwName(String wName) {
		this.wName = wName;
	}
	public String getwSex() {
		return wSex;
	}
	public void setwSex(String wSex) {
		this.wSex = wSex;
	}
	public String getwDnum() {
		return wDnum;
	}
	public void setwDnum(String wDnum) {
		this.wDnum = wDnum;
	}
	public String getwPname() {
		return wPname;
	}
	public void setwPname(String wPname) {
		this.wPname = wPname;
	}
	public String getNewWnum() {
		return newWnum;
	}
	public void setNewWnum(String newWnum) {
		this.newWnum = newWnum;
	}
	@Override
	public String toString() {
		return "Worker [wNum=" + wNum + ", wName=" + wName + ", wSex=" + wSex + ", wDnum=" + wDnum + ", wPname="
				+ wPname + ", newWnum=" + newWnum + ", department=" + department + "]";
	}
	
	
	
	

}
