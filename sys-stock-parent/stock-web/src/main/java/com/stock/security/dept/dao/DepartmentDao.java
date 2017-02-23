package com.stock.security.dept.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.stock.security.dept.model.Department;
import com.stock.security.dept.model.DepartmentCondition;
import com.stock.security.dept.model.DepartmentView;

@Repository("departmentDao")
public interface DepartmentDao {
	
	/**
	 * 新建部门返回id
	 * @author wyw
	 * @date:2016年10月7日 下午1:05:32
	 * @param dept
	 * @return
	 */
	public int insertDept(Department dept);
	/**
	 * 更新部门
	 * @author wyw
	 * @date:2016年10月7日 下午1:05:32
	 * @param dept
	 * @return
	 */
	public void updateDeptById(Department dept);
	

	/**
	 * 分页查询结果
	 * @author wyw
	 * @date:2016年10月7日 下午1:15:42
	 * @param condition
	 * @return
	 */
	public List<DepartmentView> queryDeptPageByCondition(DepartmentCondition condition);
	/**
	 * 分页查询总数
	 * @author wyw
	 * @date:2016年10月7日 下午1:15:55
	 * @param condition
	 * @return
	 */
	public long queryDeptPageCountByCondition(DepartmentCondition condition);
	
	
	
	/**
	 * 根据条件查询结果
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:59
	 * @param condition
	 * @return
	 */
	public List<DepartmentView> queryDeptListByCondition(DepartmentCondition condition);
	
	/**
	 * 根据条件查询总数
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:39
	 * @param condition
	 * @return
	 */
	public long queryDeptCountByCondition(DepartmentCondition condition);
	
	
	
	

}
