package com.xcxy.resume.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxy.practice.entity.Practice;
import com.xcxy.resume.dao.ResumeMapper;
import com.xcxy.resume.entity.Resume;
import com.xcxy.resume.service.ResumeService;
@Service
public class ResumeServiceImpl implements ResumeService {
	@Autowired
	private ResumeMapper rm;
	@Override
	public int addresume(Resume r) {
		int num=rm.addresume(r);
		return num;
	}

	@Override
	public int deleteresumeById(Integer rId) {
		int num=rm.deleteresumeById(rId);
		return num;
	}

	@Override
	public List<Resume> selectresumeBydNum(String dNum) {
		List<Resume> rs=rm.selectresumeBydNum(dNum);
		return rs;
	}

	@Override
	public int setresumetopractice(Practice p) {
		int num=rm.setresumetopractice(p);
		return num;
	}

}
