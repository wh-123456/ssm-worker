package com.xcxy.department.entity;

import java.util.Date;

public class Department {
	/*更改前的部门编号*/
	private String dNum;
	/*部门名称*/
	private String dName;
	/*部门主管*/
	private String bossName;
	/*部门人数*/
	private String count;
	/*部门创建时间*/
	private Date dTime;
	/*更改后的部门编号*/
	private String newdNum;
	
	
	public Date getdTime() {
		return dTime;
	}
	public void setdTime(Date dTime) {
		this.dTime = dTime;
	}
	public String getdNum() {
		return dNum;
	}
	public void setdNum(String dNum) {
		this.dNum = dNum;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getNewdNum() {
		return newdNum;
	}
	public void setNewdNum(String newdNum) {
		this.newdNum = newdNum;
	}
	public String getBossName() {
		return bossName;
	}
	public void setBossName(String bossName) {
		this.bossName = bossName;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Department [dNum=" + dNum + ", dName=" + dName + ", bossName=" + bossName + ", count=" + count
				+ ", dTime=" + dTime + ", newdNum=" + newdNum + "]";
	}

	
	

}
