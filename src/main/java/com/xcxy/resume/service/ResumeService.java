package com.xcxy.resume.service;

import java.util.List;

import com.xcxy.practice.entity.Practice;
import com.xcxy.resume.entity.Resume;

public interface ResumeService {
	int addresume(Resume r);
	int deleteresumeById(Integer rId);
	int setresumetopractice(Practice p);
	List<Resume> selectresumeBydNum(String dNum);
}
