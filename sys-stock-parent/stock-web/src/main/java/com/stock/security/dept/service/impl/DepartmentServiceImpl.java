package com.stock.security.dept.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stock.common.exception.SYSException;
import com.stock.security.dept.dao.DepartmentDao;
import com.stock.security.dept.model.Department;
import com.stock.security.dept.model.DepartmentCondition;
import com.stock.security.dept.model.DepartmentView;
import com.stock.security.dept.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao dao;

	@Override
	public long insertDept(Department dept) {
		dao.insertDept(dept);
		return dept.getId();
	}

	@Override
	public void updateDeptById(Department dept, long id) {
		dept.setId(id);
		dao.updateDeptById(dept);
	}

	@Override
	public List<DepartmentView> queryDeptPageByCondition(DepartmentCondition condition) {
		return dao.queryDeptPageByCondition(condition);
	}

	@Override
	public long queryDeptPageCountByCondition(DepartmentCondition condition) {
		return dao.queryDeptPageCountByCondition(condition);
	}

	@Override
	public List<DepartmentView> queryDeptListByCondition(DepartmentCondition condition) {
		return dao.queryDeptListByCondition(condition);
	}

	@Override
	public long queryDeptCountByCondition(DepartmentCondition condition) {
		return dao.queryDeptCountByCondition(condition);
	}
	
	@Override
	public DepartmentView queryDeptById(long id) {
		DepartmentCondition condition = new DepartmentCondition();
		condition.setId(id);
		List<DepartmentView> list = dao.queryDeptListByCondition(condition);
		if(list != null && list.size()>0){
			return list.get(0); 
		}
		return null;
	}

	@Override
	public void delDeptByIdList(List<Long> idList,long userId) throws SYSException {
		if(idList != null && idList.size()>0){
			Department dept = new Department();
			dept.setStatus(Department.STATUS_DELETE);
			for(Long id:idList){
				this.updateDeptById(dept, id);
			}
		}
	}

	@Override
	public void updateEnableStatusByIdList(List<Long> idList, int enableStatus, long userId) throws SYSException {
		if(idList != null && idList.size()>0){
			Department dept = new Department();
			dept.setStatus(enableStatus);
			for(Long id:idList){
				this.updateDeptById(dept, id);
			}
		}
		
	}
	
	
	
	
	
	
	

}
