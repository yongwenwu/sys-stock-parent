package com.stock.security.dept.model;

import java.io.Serializable;

/**
 * 部门视图
 * @ClassName: DepartmentView
 * @Description:
 * @author wyw
 * @date: 2017年2月23日 下午11:29:05
 *
 */
public class DepartmentView extends Department  implements Serializable {
	private static final long serialVersionUID = 7113342775696650498L;
	
	private String createTimeStr;
	public String getCreateTimeStr() {
		return createTimeStr;
	}
	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}
	
	
}
