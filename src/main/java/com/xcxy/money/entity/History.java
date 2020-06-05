package com.xcxy.money.entity;

import java.util.Date;

public class History {
	/* id*/
	private int hId;
	/*员工编号*/
	private String hNum;
	/*事件*/
	private String hContent;
	/*奖惩百分比*/
	private double hPercentage;
	/*金额*/
	private int hMoney;
	/*创建时间*/
	private Date hTime;
	public int gethId() {
		return hId;
	}
	public void sethId(int hId) {
		this.hId = hId;
	}
	public String gethNum() {
		return hNum;
	}
	public void sethNum(String hNum) {
		this.hNum = hNum;
	}
	public String gethContent() {
		return hContent;
	}
	public void sethContent(String hContent) {
		this.hContent = hContent;
	}
	public int gethMoney() {
		return hMoney;
	}
	public void sethMoney(int hMoney) {
		this.hMoney = hMoney;
	}
	public Date gethTime() {
		return hTime;
	}
	public void sethTime(Date hTime) {
		this.hTime = hTime;
	}
	public double gethPercentage() {
		return hPercentage;
	}
	public void sethPercentage(double hPercentage) {
		this.hPercentage = hPercentage;
	}
	@Override
	public String toString() {
		return "History [hId=" + hId + ", hNum=" + hNum + ", hContent=" + hContent + ", hPercentage=" + hPercentage
				+ ", hMoney=" + hMoney + ", hTime=" + hTime + "]";
	}
	
	

}
