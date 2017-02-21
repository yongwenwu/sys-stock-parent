package com.stock.security.user.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体
 * @ClassName: User
 * @Description:
 * @author wyw
 * @date: 2017年2月21日 下午4:41:56
 *
 */
public class User implements Serializable {
	private static final long serialVersionUID = 412096574443207567L;
	
	/** 状态-有效 */
	public final static int STATUS_VALID = 1;
	/** 状态-停用 */
	public final static int STATE_STOP = 2;
	/** 状态-删除 */
	public static final int  STATUS_DELETE = 3;
	
	
	private Long id; // 用户id
	private String loginName; // 用户登录账号,唯一
	private String password; // 密码
	private Integer userType; // 用户类型；1-超级系统管理员2-系统管理员3-普通用户
	private String employeeNumber; // 员工编号
	private String nickname; // 昵称
	private String trueName; // 真实姓名
	private Integer sex; // 性别,1-男；2-女
	private Date birthday; // 生日
	private Long deptId; // 部门id
	private String position; // 职务
	private String positionDesc; // 职务说明
	private String mobilePhone; // 手机号
	private String officeTelephone; // 办公室电话
	private String homeTelephone; // 家庭电话
	private String email; // 电子邮件
	private String headImgUrl; // 头像图片路径
	private String remarks; // 备注
	private Integer status; // 状态；1-启用；2-停用；3-删除
	private Date createTime; // 创建时间
	private Long createUser; // 创建人Id
	private Date updateTime; // 创建时间
	private Long updateUser; // 创建人Id
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public String getEmployeeNumber() {
		return employeeNumber;
	}
	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Long getDeptId() {
		return deptId;
	}
	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPositionDesc() {
		return positionDesc;
	}
	public void setPositionDesc(String positionDesc) {
		this.positionDesc = positionDesc;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getOfficeTelephone() {
		return officeTelephone;
	}
	public void setOfficeTelephone(String officeTelephone) {
		this.officeTelephone = officeTelephone;
	}
	public String getHomeTelephone() {
		return homeTelephone;
	}
	public void setHomeTelephone(String homeTelephone) {
		this.homeTelephone = homeTelephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHeadImgUrl() {
		return headImgUrl;
	}
	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
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
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Long getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(Long updateUser) {
		this.updateUser = updateUser;
	}

	
}
