package com.xcxy.affairs.service;

import java.util.List;

import com.xcxy.affairs.entity.Affairs;

public interface AffairsService {
	int addAffairs(Affairs a);
	Affairs selectpracticeByNum(String wNum);
	List<Affairs> selectBosspromotionBydNum(String dNum);
	List<Affairs> getrecruitList();
	List<Affairs> getrecruitDnum();
	List<Affairs> getrecruitPnameBydNum(String dNum);
	int deletepracticeByNum(String wNum);
	int deletepracticeById(int id);
	int argeepromotion(String wNum);
	int noargeePromotion(String wNum);
	List<Affairs> selectnoticeByDnum(Affairs a);
	List<Affairs> selectMynotice(Affairs a);
}
