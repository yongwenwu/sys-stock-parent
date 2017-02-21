package com.stock.security.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.stock.security.user.model.User;
import com.stock.security.user.model.UserCondition;
import com.stock.security.user.model.UserView;

@Repository("userDao")
public interface UserDao {

	/**
	 * 新建用户返回id
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:05:32
	 * @param user
	 * @return
	 */
	public int insertUser(User user);

	/**
	 * 更新用户
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:05:32
	 * @param user
	 * @return
	 */
	public void updateUserById(User user);

	/**
	 * 分页查询结果
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:15:42
	 * @param condition
	 * @return
	 */
	public List<UserView> queryUserPageByCondition(UserCondition condition);

	/**
	 * 分页查询总数
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:15:55
	 * @param condition
	 * @return
	 */
	public long queryUserPageCountByCondition(UserCondition condition);

	/**
	 * 根据条件查询结果
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:59
	 * @param condition
	 * @return
	 */
	public List<UserView> queryUserListByCondition(UserCondition condition);

	/**
	 * 根据条件查询总数
	 * 
	 * @author wyw
	 * @date:2016年10月7日 下午1:16:39
	 * @param condition
	 * @return
	 */
	public long queryUserCountByCondition(UserCondition condition);
	
	/**
	 * 根据用户名账户和密码查询用户
	 * @author wyw
	 * @date:2016年10月11日 上午12:46:31
	 * @param user
	 * @return
	 */
	public List<User> queryUserByLoginNameAndPassword(UserCondition condition);
	
	
	/**
	 * 校验账户是否重复
	 * @author wyw
	 * @date:2016年10月18日 下午11:41:43
	 * @param condition
	 * @return
	 */
	public int checkRepeatLoginName(UserCondition condition);
	

}
