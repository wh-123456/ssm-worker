package com.xcxy.resume.entity;

import java.util.Date;

public class Resume {
	/*id*/
	private Integer rId;
	/*姓名*/
	private String rName;
	/*投递部门编号*/
	private String rDnum;
	/*岗位*/
	private String rPname;
	/*性别*/
	private String rSex;
	/*年龄*/
	private Integer rAge;
	/*毕业院校*/
	private String rSchool;
	/*专业*/
	private String rSpeciality;
	/*学历*/
	private String rEducation;
	/*语言*/
	private String rLanguage;
	/*政治面貌*/
	private String rBackground;
	/*电话号码*/
	private long rTel;
	/*邮箱*/
	private String rEmail;
	/*投递时间*/
	private Date rTime;
	public Integer getrId() {
		return rId;
	}
	public void setrId(Integer rId) {
		this.rId = rId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrDnum() {
		return rDnum;
	}
	public void setrDnum(String rDnum) {
		this.rDnum = rDnum;
	}
	public String getrPname() {
		return rPname;
	}
	public void setrPname(String rPname) {
		this.rPname = rPname;
	}
	public String getrSex() {
		return rSex;
	}
	public void setrSex(String rSex) {
		this.rSex = rSex;
	}
	public Integer getrAge() {
		return rAge;
	}
	public void setrAge(Integer rAge) {
		this.rAge = rAge;
	}
	public String getrSchool() {
		return rSchool;
	}
	public void setrSchool(String rSchool) {
		this.rSchool = rSchool;
	}
	public String getrSpeciality() {
		return rSpeciality;
	}
	public void setrSpeciality(String rSpeciality) {
		this.rSpeciality = rSpeciality;
	}
	public String getrEducation() {
		return rEducation;
	}
	public void setrEducation(String rEducation) {
		this.rEducation = rEducation;
	}
	public String getrLanguage() {
		return rLanguage;
	}
	public void setrLanguage(String rLanguage) {
		this.rLanguage = rLanguage;
	}
	public String getrBackground() {
		return rBackground;
	}
	public void setrBackground(String rBackground) {
		this.rBackground = rBackground;
	}
	public long getrTel() {
		return rTel;
	}
	public void setrTel(long rTel) {
		this.rTel = rTel;
	}
	public String getrEmail() {
		return rEmail;
	}
	public void setrEmail(String rEmail) {
		this.rEmail = rEmail;
	}
	public Date getrTime() {
		return rTime;
	}
	public void setrTime(Date rTime) {
		this.rTime = rTime;
	}
	
}
