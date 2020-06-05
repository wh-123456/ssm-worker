package com.xcxy.worker.entity;

import java.util.Date;

public class WorkerInfo {
	/*员工编号*/
	private String wiNum;
	/*性别*/
	private String wiSex;
	/*年龄*/
	private Integer wiAge;
	/*生日*/
	private String birthday;
	/*籍贯*/
	private String wiAddress;
	/*毕业院校*/
	private String wiSchool;
	/*学历*/
	private String wiEducation;
	/*专业*/
	private String wiSpeciality;
	/*语言*/
	private String wiLanguage;
	/*政治面貌*/
	private String wiBackground;
	/*身份证编号*/
	private String idCard;
	/*入职时间*/
	private Date wiTime;
	/*部门编号——他表获取*/
	private String wiDnum;
	/*姓名——他表获取*/
	private String wiName;
	/*照片*/
	private String wiImage;
	/*新的员工编号——响应员工表该员工编号时*/
	private String newWinum;
	public String getWiNum() {
		return wiNum;
	}
	public void setWiNum(String wiNum) {
		this.wiNum = wiNum;
	}
	public String getWiSex() {
		return wiSex;
	}
	public void setWiSex(String wiSex) {
		this.wiSex = wiSex;
	}
	public Integer getWiAge() {
		return wiAge;
	}
	public void setWiAge(Integer wiAge) {
		this.wiAge = wiAge;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getWiAddress() {
		return wiAddress;
	}
	public void setWiAddress(String wiAddress) {
		this.wiAddress = wiAddress;
	}
	public String getWiSchool() {
		return wiSchool;
	}
	public void setWiSchool(String wiSchool) {
		this.wiSchool = wiSchool;
	}
	public String getWiEducation() {
		return wiEducation;
	}
	public void setWiEducation(String wiEducation) {
		this.wiEducation = wiEducation;
	}
	public String getWiSpeciality() {
		return wiSpeciality;
	}
	public void setWiSpeciality(String wiSpeciality) {
		this.wiSpeciality = wiSpeciality;
	}
	public String getWiLanguage() {
		return wiLanguage;
	}
	public void setWiLanguage(String wiLanguage) {
		this.wiLanguage = wiLanguage;
	}
	public String getWiBackground() {
		return wiBackground;
	}
	public void setWiBackground(String wiBackground) {
		this.wiBackground = wiBackground;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public Date getWiTime() {
		return wiTime;
	}
	public void setWiTime(Date wiTime) {
		this.wiTime = wiTime;
	}
	
	public String getWiName() {
		return wiName;
	}
	public void setWiName(String wiName) {
		this.wiName = wiName;
	}
	public String getWiDnum() {
		return wiDnum;
	}
	public void setWiDnum(String wiDnum) {
		this.wiDnum = wiDnum;
	}
	public String getNewWinum() {
		return newWinum;
	}
	public void setNewWinum(String newWinum) {
		this.newWinum = newWinum;
	}
	public String getWiImage() {
		return wiImage;
	}
	public void setWiImage(String wiImage) {
		this.wiImage = wiImage;
	}
	@Override
	public String toString() {
		return "WorkerInfo [wiNum=" + wiNum + ", wiSex=" + wiSex + ", wiAge=" + wiAge + ", birthday=" + birthday
				+ ", wiAddress=" + wiAddress + ", wiSchool=" + wiSchool + ", wiEducation=" + wiEducation
				+ ", wiSpeciality=" + wiSpeciality + ", wiLanguage=" + wiLanguage + ", wiBackground=" + wiBackground
				+ ", idCard=" + idCard + ", wiTime=" + wiTime + ", wiDnum=" + wiDnum + ", wiName=" + wiName
				+ ", wiImage=" + wiImage + ", newWinum=" + newWinum + "]";
	}


}
