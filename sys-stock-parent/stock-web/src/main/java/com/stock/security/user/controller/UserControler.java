package com.stock.security.user.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stock.security.user.model.User;
import com.stock.security.user.service.UserService;

/**
 * 用户
 * @ClassName: UserControler
 * @Description:
 * @author wyw
 * @date: 2017年2月21日 下午11:15:01
 *
 */
@RequestMapping("/manage/user")
@Controller
public class UserControler {
	private Logger logger = Logger.getLogger(getClass()) ;
	
	@Autowired
	private UserService userService;
	
	
	/**
	 * 新建用户信息
	 * @Title: addUser
	 * @Description: 
	 * @param modelAndView
	 * @param user
	 * @return
	 * @author: wyw
	 * @date: 2017年2月23日 下午11:03:57
	 */
	public ModelAndView addUser(ModelAndView modelAndView,User user){
		modelAndView.setViewName("/");
		try {
			userService.insertUser(user);
			
		} catch (Exception e) {
			logger.error("创建用户异常！" + e.getMessage());
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	
	
	

}
