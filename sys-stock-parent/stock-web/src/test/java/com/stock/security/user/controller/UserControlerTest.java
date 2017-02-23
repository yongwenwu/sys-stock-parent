package com.stock.security.user.controller;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.stock.common.SpringTest;
import com.stock.security.user.model.User;
import com.stock.security.user.model.UserCondition;
import com.stock.security.user.model.UserView;
import com.stock.security.user.service.UserService;

/**
 * 用户测试类
 * @ClassName: UserControlerTest
 * @Description:
 * @author wyw
 * @date: 2017年2月22日 上午12:22:51
 *
 */
public class UserControlerTest extends SpringTest {
	@Autowired
	ApplicationContext ctx;

	/**
	 * 新建用户测试
	 * @Title: testAddUser
	 * @Description: 
	 * @author: wyw
	 * @date: 2017年2月23日 下午11:10:42
	 */
	@Test
	public void testAddUser() {
		try {
			UserService service =  ctx.getBean(UserService.class);
			User user = new User();
			user.setLoginName("admin222");
			user.setPassword("123");
			user.setBirthday(new Date());
			user.setCreateTime(new Date());
			user.setCreateUser(1l);
			user.setDeptId(2l);
			user.setEmail("abc@123.com");
			user.setEmployeeNumber("YG00000111");
			user.setHeadImgUrl("/img/20140212/admin.jpg");
			user.setHomeTelephone("167689999");
			user.setMobilePhone("333333333");
			user.setNickname("系统管理员");
			user.setOfficeTelephone("222222223333");
			user.setPosition("职位");
			user.setPositionDesc("职位描述");
			user.setRemarks("备注");
			user.setSex(1);
			user.setStatus(1);
			user.setTrueName("真实姓名");
			user.setUpdateTime(new Date());
			user.setUpdateUser(222l);
			user.setUserType(1);
			
			
			long id = service.insertUser(user);
			System.out.println("id：" + id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 编辑用户信息
	 * @Title: updateUser
	 * @Description: 
	 * @author: wyw
	 * @date: 2017年2月23日 下午11:10:56
	 */
	@Test
	public void updateUser() {
		try {
			UserService service =  ctx.getBean(UserService.class);
			User user = new User();
			user.setLoginName("admin222aa");
			user.setPassword("123aa");
			user.setBirthday(new Date());
			user.setCreateTime(new Date());
			user.setCreateUser(122l);
			user.setDeptId(2l);
			user.setEmail("abcaa@123.com");
			user.setEmployeeNumber("YG00000111aa");
			user.setHeadImgUrl("/img/20140212aa/admin.jpg");
			user.setHomeTelephone("167689999aa");
			user.setMobilePhone("333333333aa");
			user.setNickname("系统管理员aa");
			user.setOfficeTelephone("222222223333aa");
			user.setPosition("职位aa");
			user.setPositionDesc("职位描述aa");
			user.setRemarks("备注aa");
			user.setSex(2);
			user.setStatus(2);
			user.setTrueName("真实姓名aa");
			user.setUpdateTime(new Date());
			user.setUpdateUser(22233l);
			user.setUserType(2);
			service.updateUserById(user, 3l);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

	
	/**
	 * 查询
	 * @Title: updateUser
	 * @Description: 
	 * @author: wyw
	 * @date: 2017年2月23日 下午11:10:56
	 */
	@Test
	public void queryUserPageByCondition() {
		try {
			UserService service =  ctx.getBean(UserService.class);
			UserCondition condition = new UserCondition();
			condition.setLoginName("admin222aa");
			List<UserView> list =  service.queryUserPageByCondition(condition);
			for(UserView view:list){
				System.out.println(view.getId() + "  >" + view.getLoginName());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
}
