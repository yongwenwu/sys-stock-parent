package com.stock.security.user.model;

import java.io.Serializable;

/**
 * 视图模型
 * @ClassName: UserView
 * @Description:
 * @author wyw
 * @date: 2017年2月21日 下午4:52:53
 *
 */
public class UserView extends User implements Serializable {
	private static final long serialVersionUID = -1150560618406078145L;
	private String createTimeStr;
	private String updateTimeStr;
	public String getCreateTimeStr() {
		return createTimeStr;
	}
	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}
	public String getUpdateTimeStr() {
		return updateTimeStr;
	}
	public void setUpdateTimeStr(String updateTimeStr) {
		this.updateTimeStr = updateTimeStr;
	}
	
	
	

}
