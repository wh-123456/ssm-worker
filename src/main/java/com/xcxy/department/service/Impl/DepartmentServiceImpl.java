package com.xcxy.department.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxy.department.dao.DepartmentMapper;
import com.xcxy.department.entity.Department;
import com.xcxy.department.service.DepartmentService;
import com.xcxy.money.entity.Money;
import com.xcxy.user.dao.UserMapper;
import com.xcxy.user.entity.User;
import com.xcxy.worker.dao.WorkerMapper;
import com.xcxy.worker.entity.Worker;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	DepartmentMapper departmentmapper;
	@Autowired
	WorkerMapper workermapper;
	@Autowired
	UserMapper usermapper;

	@Override
	public int adddepartment(Department department) {
		int num=departmentmapper.adddepartment(department);
		return num;
	}

	@Override
	public int updatedepartment(Department department) {
		int num=departmentmapper.updatedepartment(department);
		return num;
	}

	@Override
	public int updateWokerDe(Department department) {
		int num=departmentmapper.updateWokerDe(department);
		return num;
	}

	@Override
	public int deleteDepartment(String dNum) {
		int num=departmentmapper.deleteDepartment(dNum);
		return num;
	}

	@Override
	public List<Department> finddepartment() {
		List<Department> ds=departmentmapper.finddepartment();
		return ds;
	}

	@Override
	public int deleteDepartmentWorker(String dNum) {
		int num=departmentmapper.deleteDepartmentWorker(dNum);
		return num;
	}

	@Override
	public int deleteDepartmentWorkerInfo(String dNum) {
		int num=departmentmapper.deleteDepartmentWorkerInfo(dNum);
		return num;
	}

	@Override
	public int updateWorkerDnum(String dNum) {
		int num=departmentmapper.updateWorkerDnum(dNum);
		return num;
	}

	@Override
	public int updateWorkerBoss(String dNum) {
		int num=departmentmapper.updateWorkerBoss(dNum);
		/*将改部门部长的角色id改为职员*/
		List<Worker> ws=workermapper.getBossList();
		User u=new User();
		u.setFkRoId(3);
		for (Worker worker : ws) {
			if(worker.getwDnum()==dNum){
				u.setuWnum(worker.getwNum());
			}
		}
		usermapper.updateUserrId(u);
		return num;
	}

	@Override
	public int updateWorkerBoss2(Worker w) {
		int num=departmentmapper.updateWorkerBoss2(w);
		return num;
	}

	@Override
	public List<Money> selectpNameByNum(String dNum) {
		List<Money> ms=departmentmapper.selectpNameByNum(dNum);
 		return ms;
	}

	@Override
	public int addPnameByNum(Money m) {
		int num=departmentmapper.addPnameByNum(m);
		return num;
	}

	@Override
	public int deletePnameByNum(Money m) {
		int num=departmentmapper.deletePnameByNum(m);
		return num;
	}

	@Override
	public int updatePnameByNum(Money m) {
		int num=departmentmapper.updatePnameByNum(m);
		return num;
	}

	@Override
	public List<Department> selectBossByDnum(String dNum) {
		List<Department> ds=departmentmapper.selectBossByDnum(dNum);
		return ds;
	}

}
