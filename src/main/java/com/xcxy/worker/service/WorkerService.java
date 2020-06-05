package com.xcxy.worker.service;

import java.util.List;

import com.xcxy.worker.entity.Worker;
import com.xcxy.worker.entity.WorkerInfo;

public interface WorkerService {
	
	/**
	 * 员工列表增删改查
	 * @param w
	 * @return
	 */
	int addWorker(Worker w);
	int deleteWorkerById(String wNum);
	int deleteWorkerSome(List wNums);
	int updateworkerById(Worker w);
	Worker selectWorkerbywNum(String wNum);
	Worker selectBossbywNum(String wNum);
	List<Worker> findWorkerList();
	List<Worker> findWorkerListAll();
	List<Worker> findWorkerByNameOrNum(String s);
	List<Worker> findWorkerByNum(Worker w);
	List<Worker> findWorkerByNameOrNum2(Worker w);
	List<Worker> getBossList();
	List<Worker> getpeopleList();
	
	/**
	 * 员工信息表增删改查
	 */
	int addworkerInfo(WorkerInfo wi);
	int deleteworkerInfoById(String wiNum);
	int deleteworkerInfoSome(List wNums);
	int updateworkerInfoById(WorkerInfo wi);
	List<WorkerInfo> findWorkerInfoByIdOrName(WorkerInfo wi);
	List<WorkerInfo> findWorkerInfo();
	List<WorkerInfo> findWorkerInfoByDnum(WorkerInfo wi);
	List<WorkerInfo> findWorkerInfoById(String wNum);

}
