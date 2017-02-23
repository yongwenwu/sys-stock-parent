package com.stock.security.dept.service;

import java.util.List;

import com.stock.common.exception.SYSException;
import com.stock.security.dept.model.Department;
import com.stock.security.dept.model.DepartmentCondition;
import com.stock.security.dept.model.DepartmentView;

/**
 * 部门接口类
 * @author wyw
 * @date:2016年10月3日 下午10:58:18
 */
public interface DepartmentService {
	
	/**
	 * 新建部门返回id
	 * @author wyw
	 * @date:2016年10月7日 下午1:05:32
	 * @param dept
	 * @return
	 */
	public long insertDept(Department dept) throws SYSException;
	/**
	 * 更新部门
	 * @author wyw
	 * @date:2016年10月7日 下午1:05:32
	 * @param dept
	 * @return
	 */
	public void updateDeptById(Department dept,long id) throws SYSException;
	
	/**
	 * 分页查询结果
	 * @author wyw
	 * @date:2016年10月7日 下午1:15:42
	 * @param condition
	 * @return
	 */
	public List<DepartmentView> queryDeptPageByCondition(DepartmentCondition condition) throws SYSException;
	/**
	 * 分页查询总数
	 * @author wyw
	 * @date:2016年10月7日 下午1:15:55
	 * @param condition
	 * @return
	 */
	public long queryDeptPageCountByCondition(DepartmentCondition condition) throws SYSException;
	

	/**
	 * 根据条件查询多条结果
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:59
	 * @param condition
	 * @return
	 */
	public List<DepartmentView> queryDeptListByCondition(DepartmentCondition condition) throws SYSException;
	
	/**
	 * 根据条件查询总数
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:39
	 * @param condition
	 * @return
	 */
	public long queryDeptCountByCondition(DepartmentCondition condition) throws SYSException;
	
	
	
	/**
	 * 根据id查询数据
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:59
	 * @param condition
	 * @return
	 */
	public DepartmentView queryDeptById(long id) throws SYSException;
	
	/**
	 * 删除部门（逻辑删除）
	 * @author wyw
	 * @date:2016年10月10日 上午11:47:40
	 * @param idList
	 * @param userId
	 * @throws SYSException
	 */
	public void delDeptByIdList(List<Long> idList,long userId) throws SYSException;
	
	/**
	 * 更新启用或停用状态
	 * @author wyw
	 * @date:2016年10月10日 下午1:35:04
	 * @param idList
	 * @param enableStatus
	 * @param userId
	 * @throws SYSException
	 */
	public void updateEnableStatusByIdList(List<Long> idList,int enableStatus,long userId) throws SYSException;
	
	

}
