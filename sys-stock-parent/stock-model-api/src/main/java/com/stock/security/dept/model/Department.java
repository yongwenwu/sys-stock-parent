package com.stock.security.dept.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 部门实体类
 * @ClassName: Department
 * @Description:
 * @author wyw
 * @date: 2017年2月23日 下午11:23:54
 *
 */
public class Department implements Serializable {
	private static final long serialVersionUID = -6528696867004439322L;
	
	/** 状态-有效 */
	public final static int STATUS_VALID = 1;
	/** 状态-停用 */
	public final static int STATE_STOP = 2;
	/** 状态-删除 */
	public static final int  STATUS_DELETE = 3;
	
	
	private Long id; //部门id
	private String deptName; //部门名称
	private Integer deptNo; //部门排序号
	private Long parentId; //上级部门id
	private String parentIdFull; //部门全路径id
	private String remarks; //备注
	private Integer status; //状态；1-启用；2-停用；3-删除
	private Date createTime; //创建时间
	private Long createUser; //创建人Id
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public Integer getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(Integer deptNo) {
		this.deptNo = deptNo;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public String getParentIdFull() {
		return parentIdFull;
	}
	public void setParentIdFull(String parentIdFull) {
		this.parentIdFull = parentIdFull;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Long getCreateUser() {
		return createUser;
	}
	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}
	
	
	
}
