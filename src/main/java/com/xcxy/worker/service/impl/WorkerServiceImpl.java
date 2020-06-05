package com.xcxy.worker.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xcxy.worker.dao.WorkerMapper;
import com.xcxy.worker.entity.Worker;
import com.xcxy.worker.entity.WorkerInfo;
import com.xcxy.worker.service.WorkerService;
@Service
public class WorkerServiceImpl implements WorkerService {
@Autowired
private WorkerMapper workermapper;
	/**
	 * 员工列表增删改查
	 */
	@Override
	public int addWorker(Worker w) {
		int num=workermapper.addWorker(w);
		return num;
	}
	@Override
	public int deleteWorkerById(String wNum) {
		int num=workermapper.deleteWorkerById(wNum);
		return num;
	}
	@Override
	public int updateworkerById(Worker w) {
		int num=workermapper.updateworkerById(w);
		return num;
	}
	@Override
	public List<Worker> findWorkerList() {
		List<Worker> ws=workermapper.findWorkerList();
		return ws;
	}
	/**
	 * 员工信息表增删改查
	 */
	@Override
	public int addworkerInfo(WorkerInfo wi) {
		int num=workermapper.addworkerInfo(wi);
		return num;
	}
	
	@Override
	public List<WorkerInfo> findWorkerInfo() {
		List<WorkerInfo> wis=workermapper.findWorkerInfo();
		return wis;
	}
	@Override
	public int updateworkerInfoById(WorkerInfo wi) {
		int num=workermapper.updateworkerInfoById(wi);
		return num;
	}
	@Override
	public int deleteworkerInfoById(String wiNum) {
		int num=workermapper.deleteworkerInfoById(wiNum);
		return num;
	}
	@Override
	public List<Worker> findWorkerByNameOrNum(String s) {
		List<Worker> ws=workermapper.findWorkerByNameOrNum(s);
		return ws;
	}
	@Override
	public List<WorkerInfo> findWorkerInfoByDnum(WorkerInfo wi) {
		List<WorkerInfo> wis=workermapper.findWorkerInfoByDnum(wi);
		return wis;
	}
	@Override
	public List<WorkerInfo> findWorkerInfoByIdOrName(WorkerInfo wi) {
		List<WorkerInfo> wis=workermapper.findWorkerInfoByIdOrName(wi);
		return wis;
	}
	@Override
	public List<WorkerInfo> findWorkerInfoById(String wNum) {
		List<WorkerInfo> wis=workermapper.findWorkerInfoById(wNum);
		return wis;
	}
	
	@Override
	public List<Worker> findWorkerByNum(Worker w) {
		List<Worker> ws=workermapper.findWorkerByNum(w);
		return ws;
	}
	@Override
	public List<Worker> findWorkerByNameOrNum2(Worker w) {
		List<Worker> ws=workermapper.findWorkerByNameOrNum2(w);
		return ws;
	}
	@Override
	public List<Worker> findWorkerListAll() {
		List<Worker> ws=workermapper.findWorkerListAll();
		return ws;
	}
	@Override
	public List<Worker> getBossList() {
		List<Worker> ws=workermapper.getBossList();
		return ws;
	}
	@Override
	public List<Worker> getpeopleList() {
		List<Worker> ws=workermapper.getpeopleList();
		return ws;
	}
	@Override
	public Worker selectWorkerbywNum(String wNum) {
		Worker w=workermapper.selectWorkerbywNum(wNum);
		return w;
	}
	@Override
	public Worker selectBossbywNum(String wNum) {
		Worker w=workermapper.selectBossbywNum(wNum);
		return w;
	}
	@Override
	public int deleteWorkerSome(List wNums) {
		int num=workermapper.deleteWorkerSome(wNums);
		return num;
	}
	@Override
	public int deleteworkerInfoSome(List wNums) {
		int num=workermapper.deleteworkerInfoSome(wNums);
		return num;
	}
	
	
}
