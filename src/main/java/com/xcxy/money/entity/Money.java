package com.xcxy.money.entity;

public class Money {
	/*编号*/
	private Integer mNum;
	/*部门编号*/
	private String mDnum;
	/*职称*/
	private String mPname;
	/*工资下限*/
	private Double mMin;
	/*工资上限*/
	private Double mMax;
	/*员工福利*/
	private String mSafe;
	/*新部门编号——用于存储将要更改的部门编号*/
	private String newmDnum;
	
	public String getNewmDnum() {
		return newmDnum;
	}
	public void setNewmDnum(String newmDnum) {
		this.newmDnum = newmDnum;
	}
	public Integer getmNum() {
		return mNum;
	}
	public void setmNum(Integer mNum) {
		this.mNum = mNum;
	}
	public String getmDnum() {
		return mDnum;
	}
	public void setmDnum(String mDnum) {
		this.mDnum = mDnum;
	}
	public String getmPname() {
		return mPname;
	}
	public void setmPname(String mPname) {
		this.mPname = mPname;
	}
	public Double getmMin() {
		return mMin;
	}
	public void setmMin(Double mMin) {
		this.mMin = mMin;
	}
	public Double getmMax() {
		return mMax;
	}
	public void setmMax(Double mMax) {
		this.mMax = mMax;
	}
	public String getmSafe() {
		return mSafe;
	}
	public void setmSafe(String mSafe) {
		this.mSafe = mSafe;
	}
	@Override
	public String toString() {
		return "Money [mNum=" + mNum + ", mDnum=" + mDnum + ", mPname=" + mPname + ", mMin=" + mMin + ", mMax=" + mMax
				+ ", mSafe=" + mSafe + "]";
	}


}
