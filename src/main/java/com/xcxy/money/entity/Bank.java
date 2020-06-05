package com.xcxy.money.entity;

public class Bank {
	/*职员编号*/
	private String bWnum;
	/*银行卡号*/
	private String bNum;
	/*所属银行*/
	private String bBank;
	public String getbWnum() {
		return bWnum;
	}
	public void setbWnum(String bWnum) {
		this.bWnum = bWnum;
	}
	public String getbNum() {
		return bNum;
	}
	public void setbNum(String bNum) {
		this.bNum = bNum;
	}
	public String getbBank() {
		return bBank;
	}
	public void setbBank(String bBank) {
		this.bBank = bBank;
	}
	@Override
	public String toString() {
		return "Bank [bWnum=" + bWnum + ", bNum=" + bNum + ", bBank=" + bBank + "]";
	}
	

}
