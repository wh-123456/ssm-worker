package com.xcxy.department.service;

import java.util.List;

import com.xcxy.department.entity.Department;
import com.xcxy.money.entity.Money;
import com.xcxy.worker.entity.Worker;

public interface DepartmentService {
	/**
	 * 部门增删改查
	 */
	int adddepartment(Department department);
	int addPnameByNum(Money m);
	int deleteDepartment(String dNum);
	int deleteDepartmentWorker(String dNum);
	int deleteDepartmentWorkerInfo(String dNum);
	int deletePnameByNum(Money m);
	int updatedepartment(Department department);
	int updatePnameByNum(Money m);
	int updateWokerDe(Department department);
	int updateWorkerDnum(String dNum);
	int updateWorkerBoss(String dNum);
	int updateWorkerBoss2(Worker w);
	List<Department> finddepartment();
	List<Money> selectpNameByNum(String dNum);
	List<Department> selectBossByDnum(String dNum);
}
