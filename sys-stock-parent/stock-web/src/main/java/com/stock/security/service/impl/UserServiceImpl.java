package com.stock.security.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stock.common.exception.SYSException;
import com.stock.security.dao.UserDao;
import com.stock.security.user.model.User;
import com.stock.security.user.model.UserCondition;
import com.stock.security.user.model.UserView;
import com.stock.security.user.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao dao;

	@Override
	public long insertUser(User user) throws SYSException {
		dao.insertUser(user);
		return user.getId();
	}

	@Override
	public void updateUserById(User user, Long id) throws SYSException {
		// TODO Auto-generated method stub
		user.setId(id);
		dao.updateUserById(user);
	}

	@Override
	public List<UserView> queryUserPageByCondition(UserCondition condition) throws SYSException {
		// TODO Auto-generated method stub
		return dao.queryUserPageByCondition(condition);
	}

	@Override
	public long queryUserPageCountByCondition(UserCondition condition) throws SYSException {
		// TODO Auto-generated method stub
		return dao.queryUserPageCountByCondition(condition);
	}

	@Override
	public List<UserView> queryUserListByCondition(UserCondition condition) throws SYSException {
		// TODO Auto-generated method stub
		return dao.queryUserListByCondition(condition);
	}

	@Override
	public long queryUserCountByCondition(UserCondition condition) throws SYSException {
		// TODO Auto-generated method stub
		return dao.queryUserCountByCondition(condition);
	}

	@Override
	public UserView queryUserById(Long id) throws SYSException {
		// TODO Auto-generated method stub
		UserCondition condition = new UserCondition();
		condition.setId(id);
		List<UserView> list = dao.queryUserListByCondition(condition);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void delUserByIdList(List<Long> idList) throws SYSException {
		// TODO Auto-generated method stub
		if (idList != null && idList.size() > 0) {
			User user = new User();
			user.setStatus(User.STATUS_DELETE);
			user.setUpdateTime(new Date());
			for (Long id : idList) {
				this.updateUserById(user, id);
			}
		}
	}

	@Override
	public void updateStatusByIdList(List<Long> idList, Integer status) throws SYSException {
		// TODO Auto-generated method stub
		if (idList != null && idList.size() > 0) {
			User user = new User();
			user.setStatus(status);
			user.setUpdateTime(new Date());
			// 可放到list然后异常一提交
			for (Long id : idList) {
				this.updateUserById(user, id);
			}
		}
	}

	@Override
	public User queryUserByLoginNameAndPassword(String loginName, String password) throws SYSException {
		// TODO Auto-generated method stub
		UserCondition condition = new UserCondition();
		condition.setLoginName(loginName);
		condition.setPassword(password);
		List<User> list = dao.queryUserByLoginNameAndPassword(condition);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int checkRepeatLoginName(String loginName, Long id) throws SYSException {
		// TODO Auto-generated method stub
		UserCondition condition = new UserCondition();
		condition.setId(id);
		condition.setLoginName(loginName);
		return dao.checkRepeatLoginName(condition);
	}

}
