package com.stock.security.user.controller;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.stock.common.SpringTest;
import com.stock.security.user.model.User;
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

}