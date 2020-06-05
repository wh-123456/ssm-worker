package com.xcxy.practice.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxy.department.entity.Department;
import com.xcxy.practice.dao.PracticeMapper;
import com.xcxy.practice.entity.Practice;
import com.xcxy.practice.service.PracticeService;
@Service
public class PracticeServiceImpl implements PracticeService {
	@Autowired
	private PracticeMapper practicemapper;

	@Override
	public List<Practice> findpracticeList(Practice p) {
		List<Practice> ps=practicemapper.findpracticeList(p);
		return ps;
	}

	@Override
	public int addpractice(Practice p) {
		int num=practicemapper.addpractice(p);
		return num;
	}

	@Override
	public int deletepractice(String pNum) {
		int num=practicemapper.deletepractice(pNum);
		return num;
	}

	@Override
	public int updatepractice(Practice p) {
		int num=practicemapper.updatepractice(p);
		return num;
	}

	@Override
	public int insertpracticeToworker(String pNum) {
		int num=practicemapper.insertpracticeToworker(pNum);
		return num;
	}

	@Override
	public Practice selectpracticeByNum(String pNum) {
		Practice ps=practicemapper.selectpracticeByNum(pNum);
		return ps;
	}

	@Override
	public int updateallpracticeDnum(Department d) {
		int num=practicemapper.updateallpracticeDnum(d);
		return 0;
	}

	@Override
	public int updatepracticeToBydNum(String dNum) {
		int num=practicemapper.updatepracticeToBydNum(dNum);
		return num;
	}

	@Override
	public int deletePracticeByDnum(String dNum) {
		int num=practicemapper.deletePracticeByDnum(dNum);
		return num;
	}

}
