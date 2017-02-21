package com.stock.security.user.model;

import java.io.Serializable;

import com.stock.common.httpmodel.DataGridModel;

/**
 * 条件模型
 * @ClassName: UserCondition
 * @Description:
 * @author wyw
 * @date: 2017年2月21日 下午4:53:07
 *
 */
public class UserCondition extends User  implements Serializable{
	private static final long serialVersionUID = 7705261618157445306L;
	private DataGridModel dataGridModel; //分页条件
	private String createTimeMin; 
	private String createTimeMax;
	private String updateTimeMin;
	private String updateTimeMax;
	private String birthdayMin;
	private String birthdayMax;
	private String ids;
	private String newPassword1;
	private String newPassword2;
	
	
	
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
	public String getUpdateTimeMin() {
		return updateTimeMin;
	}
	public void setUpdateTimeMin(String updateTimeMin) {
		this.updateTimeMin = updateTimeMin;
	}
	public String getUpdateTimeMax() {
		return updateTimeMax;
	}
	public void setUpdateTimeMax(String updateTimeMax) {
		this.updateTimeMax = updateTimeMax;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getBirthdayMin() {
		return birthdayMin;
	}
	public void setBirthdayMin(String birthdayMin) {
		this.birthdayMin = birthdayMin;
	}
	public String getBirthdayMax() {
		return birthdayMax;
	}
	public void setBirthdayMax(String birthdayMax) {
		this.birthdayMax = birthdayMax;
	}
	public String getNewPassword1() {
		return newPassword1;
	}
	public void setNewPassword1(String newPassword1) {
		this.newPassword1 = newPassword1;
	}
	public String getNewPassword2() {
		return newPassword2;
	}
	public void setNewPassword2(String newPassword2) {
		this.newPassword2 = newPassword2;
	} 
	
	
	
	
	

}
