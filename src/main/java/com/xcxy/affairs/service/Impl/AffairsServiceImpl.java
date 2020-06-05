package com.xcxy.affairs.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxy.affairs.dao.AffairsMapper;
import com.xcxy.affairs.entity.Affairs;
import com.xcxy.affairs.service.AffairsService;
@Service
public class AffairsServiceImpl implements AffairsService {
		@Autowired
		private AffairsMapper am;

		@Override
		public int addAffairs(Affairs a) {
			int num=am.addAffairs(a);
			return num;
		}

		@Override
		public Affairs selectpracticeByNum(String wNum) {
			Affairs a=am.selectpracticeByNum(wNum);
			return a;
		}

		@Override
		public int deletepracticeByNum(String wNum) {
			int num=am.deletepracticeByNum(wNum);
			return num;
		}

		@Override
		public List<Affairs> selectBosspromotionBydNum(String dNum) {
			List<Affairs> as=am.selectBosspromotionBydNum(dNum);
			return as;
		}

		@Override
		public int argeepromotion(String wNum) {
			int num=am.argeepromotion(wNum);
			return num;
		}

		@Override
		public int noargeePromotion(String wNum) {
			int num=am.noargeePromotion(wNum);
			return num;
		}

		@Override
		public List<Affairs> getrecruitList() {
			List<Affairs> as=am.getrecruitList();
			return as;
		}

		@Override
		public int deletepracticeById(int id) {
			int num=am.deletepracticeById(id);
			return num;
		}

		@Override
		public List<Affairs> getrecruitDnum() {
			List<Affairs> as=am.getrecruitDnum();
			return as;
		}

		@Override
		public List<Affairs> getrecruitPnameBydNum(String dNum) {
			List<Affairs> as=am.getrecruitPnameBydNum(dNum);
			return as;
		}

		@Override
		public List<Affairs> selectnoticeByDnum(Affairs a) {
			List<Affairs> as=am.selectnoticeByDnum(a);
			return as;
		}

		@Override
		public List<Affairs> selectMynotice(Affairs a) {
			List<Affairs> as=am.selectMynotice(a);
			return as;
		}

		
}
