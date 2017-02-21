package com.stock.security.user.service;

import java.util.List;

import com.stock.common.exception.SYSException;
import com.stock.security.user.model.User;
import com.stock.security.user.model.UserCondition;
import com.stock.security.user.model.UserView;

/**
 * 用户接口类
 * 
 * @author wyw
 * @date:2016年10月3日 下午10:58:18
 */
public interface UserService {

	/**
	 * 新建用户返回id
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:05:32
	 * @param user
	 * @return
	 */
	public long insertUser(User user) throws SYSException;

	/**
	 * 更新用户
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:05:32
	 * @param user
	 * @return
	 */
	public void updateUserById(User user, Long id) throws SYSException;

	/**
	 * 分页查询结果
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:15:42
	 * @param condition
	 * @return
	 */
	public List<UserView> queryUserPageByCondition(UserCondition condition) throws SYSException;

	/**
	 * 分页查询总数
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:15:55
	 * @param condition
	 * @return
	 */
	public long queryUserPageCountByCondition(UserCondition condition) throws SYSException;

	/**
	 * 根据条件查询多条结果
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:59
	 * @param condition
	 * @return
	 */
	public List<UserView> queryUserListByCondition(UserCondition condition) throws SYSException;

	/**
	 * 根据条件查询总数
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:39
	 * @param condition
	 * @return
	 */
	public long queryUserCountByCondition(UserCondition condition) throws SYSException;

	/**
	 * 根据id查询数据
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:59
	 * @param condition
	 * @return
	 */
	public UserView queryUserById(Long id) throws SYSException;

	/**
	 * 删除用户（逻辑删除）
	 * 
	 * @Title: delUserByIdList
	 * @Description:
	 * @param idList
	 * @throws SYSException
	 * @author: wyw
	 * @date: 2017年2月21日 下午6:38:57
	 */
	public void delUserByIdList(List<Long> idList) throws SYSException;

	/**
	 * 更新状态
	 * 
	 * @Title: updateStatusByIdList
	 * @Description:
	 * @param idList
	 * @param enableStatus
	 * @throws SYSException
	 * @author: wyw
	 * @date: 2017年2月21日 下午6:37:47
	 */
	public void updateStatusByIdList(List<Long> idList, Integer enableStatus) throws SYSException;

	/**
	 * 根据用户名账户和密码查询用户
	 * 
	 * @author wyw
	 * @date:2016年10月10日 下午9:56:23
	 * @param loginName
	 * @param password
	 * @return
	 * @throws SYSException
	 */
	public User queryUserByLoginNameAndPassword(String loginName, String password) throws SYSException;

	/**
	 * 校验账户是否重复
	 * 
	 * @author wyw
	 * @date:2016年10月18日 下午11:35:26
	 * @param userId
	 * @param id
	 * @return
	 * @throws SYSException
	 */
	public int checkRepeatLoginName(String loginName, Long id) throws SYSException;

}
