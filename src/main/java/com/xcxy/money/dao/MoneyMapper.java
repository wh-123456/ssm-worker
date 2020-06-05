package com.xcxy.money.dao;

import java.util.List;

import com.xcxy.money.entity.Bank;
import com.xcxy.money.entity.History;
import com.xcxy.money.entity.Money;

public interface MoneyMapper {
	List<Money> findMoneyList(Money m);
	int updateMoneyByDnumAndPname(Money m);
	int updateMoneyDnum(Money m);
	List<History> findHistoryByNum(History h);
	int addHistoryByNum(History h);
	Bank selectBankBywNum(String wNum);
	int addBank(Bank b);
	int updatBank(Bank b);
	int deleteMoneyByDnum(String dNum);
}
