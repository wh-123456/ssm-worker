package com.xcxy.practice.service;

import java.util.List;

import com.xcxy.department.entity.Department;
import com.xcxy.practice.entity.Practice;

public interface PracticeService {
	int addpractice(Practice p);
	int deletepractice(String pNum);
	int updatepractice(Practice p);
	int insertpracticeToworker(String pNum);
	List<Practice> findpracticeList(Practice p);
	Practice selectpracticeByNum(String pNum);
	int updateallpracticeDnum(Department d);
	int updatepracticeToBydNum(String dNum);
	int deletePracticeByDnum(String dNum);
}
