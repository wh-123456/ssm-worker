package com.xcxy.money.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxy.money.dao.MoneyMapper;
import com.xcxy.money.entity.Bank;
import com.xcxy.money.entity.History;
import com.xcxy.money.entity.Money;
import com.xcxy.money.service.MoneyService;
import com.xcxy.shiro.util.Base64Utils;
@Service
public class MoneyServiceImpl implements MoneyService {
	@Autowired
	private MoneyMapper moneymapper;

	@Override
	public List<Money> findMoneyList(Money m) {
		List<Money> ms=moneymapper.findMoneyList(m);
		return ms;
	}

	@Override
	public int updateMoneyByDnumAndPname(Money m) {
		int num=moneymapper.updateMoneyByDnumAndPname(m);
		return num;
	}

	@Override
	public int updateMoneyDnum(Money m) {
		int num=moneymapper.updateMoneyDnum(m);
		return num;
	}

	@Override
	public List<History> findHistoryByNum(History h) {
		List<History> hs=moneymapper.findHistoryByNum(h);
		return hs;
	}

	@Override
	public int addHistoryByNum(History h) {
		int num=moneymapper.addHistoryByNum(h);
		return num;
	}

	@Override
	public Bank selectBankBywNum(String wNum) {
		Bank b=moneymapper.selectBankBywNum(wNum);
		/*Base64解密*/
		if(b!=null){
			b.setbNum(Base64Utils.decodeStr(b.getbNum()));
		}
		return b;
	}

	@Override
	public int updatBank(Bank b) {
		/*Base64加密*/
		b.setbNum(Base64Utils.encodeStr(b.getbNum()));
		int num=moneymapper.updatBank(b);
		return num;
	}

	@Override
	public int addBank(Bank b) {
		/*Base64加密*/
		b.setbNum(Base64Utils.encodeStr(b.getbNum()));
		int num=moneymapper.addBank(b);
		return num;
	}

	@Override
	public int deleteMoneyByDnum(String dNum) {
		int num=moneymapper.deleteMoneyByDnum(dNum);
		return num;
	}

}
