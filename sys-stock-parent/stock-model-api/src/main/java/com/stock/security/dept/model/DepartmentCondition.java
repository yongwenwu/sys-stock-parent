package com.stock.security.dept.model;

import java.io.Serializable;

import com.stock.common.httpmodel.DataGridModel;

/**
 *  部门查询条件
 * @ClassName: DepartmentCondition
 * @Description:
 * @author wyw
 * @date: 2017年2月23日 下午11:28:25
 *
 */
public class DepartmentCondition extends Department  implements Serializable {
	private static final long serialVersionUID = -5573114985334491343L;
	private DataGridModel dataGridModel; //分页条件
	private String createTimeMin; 
	private String createTimeMax;
	private String ids; 
	
	public DataGridModel getDataGridModel() {
		return dataGridModel;
	}
	public void setDataGridModel(DataGridModel dataGridModel) {
		this.dataGridModel = dataGridModel;
	}
	public String getCreateTimeMin() {
		return createTimeMin;
	}
	public void setCreateTimeMin(String createTimeMin) {
		this.createTimeMin = createTimeMin;
	}
	public String getCreateTimeMax() {
		return createTimeMax;
	}
	public void setCreateTimeMax(String createTimeMax) {
		this.createTimeMax = createTimeMax;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
	
	
	
}
