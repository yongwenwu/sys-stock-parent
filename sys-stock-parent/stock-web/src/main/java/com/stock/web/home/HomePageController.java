package com.stock.web.home;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stock.common.exception.SYSException;
import com.stock.common.global.ContextPath;
import com.stock.common.httpmodel.JsonResult;
import com.stock.common.util.SystemUtil;

/**
 * 
 * @author wyw
 * @date:2016年9月25日 下午8:26:11
 */
@Controller
@RequestMapping("/home")
public class HomePageController {
	private Logger logger = Logger.getLogger(getClass());

	
	
	
	

	/**
	 * 返回首页
	 * 
	 * @author wyw
	 * @date:2016年9月25日 下午8:26:02
	 * @return
	 */
	@RequestMapping("/home.do")
	public String home(HttpServletRequest request,HttpServletResponse response ,ModelMap modelMap) {
		modelMap.addAttribute("user",null);
		return "/common/home/home";
	}

	/**
	 * 返回顶部页面
	 * 
	 * @author wyw
	 * @date:2016年9月25日 下午8:28:19
	 * @return
	 */
	@RequestMapping("/head.do")
	public String head(HttpServletRequest request,HttpServletResponse response ,ModelMap modelMap) {
		modelMap.addAttribute("user",null);

		return "/common/home/head";
	}

	/**
	 * 返回左侧页面
	 * 
	 * @author wyw
	 * @date:2016年9月25日 下午8:28:19
	 * @return
	 */
	@RequestMapping("/left.do")
	public String left() {

		return "/common/home/left";
	}

	/**
	 * 返回右侧页面
	 * 
	 * @author wyw
	 * @date:2016年9月25日 下午8:28:19
	 * @return
	 */
	@RequestMapping("/right.do")
	public String right() {

		return "/common/home/right";
	}
	
	/**
	 * 跳转登录页
	 * @author wyw
	 * @date:2017年2月19日 下午1:51:36
	 * @return
	 */
	@RequestMapping("/toLogin.do")
	public String toLogin(){
		
		return "/common/home/login";
	}

	/**
	 * 登录
	 * 
	 * @author wyw
	 * @date:2016年10月10日 下午9:12:20
	 * @param request
	 * @param response
	 * @throws SYSException
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public JsonResult login(HttpServletRequest request, HttpServletResponse response) throws SYSException {
		JsonResult json = new JsonResult();
		 int loginStatus = 1;//1-成功；2-账户不能为空；3-密码不能为空；4-用户名或密码错误
		String userId = SystemUtil.null2Empty(request.getParameter("userId"));
		String password = SystemUtil.null2Empty(request.getParameter("password"));

		if (StringUtils.isBlank(userId.trim())) {
			json.setMsg("用户名不能为空");
			Map<String,Integer> map = new HashMap<String,Integer>();
			loginStatus = 2;
			map.put("loginStatus", loginStatus);
			json.setData(map);
			return json;
		}
		try {
			Map<String,Integer> map = new HashMap<String,Integer>();
			loginStatus = 1;
			map.put("loginStatus", loginStatus);
			json.setData(map);
		} catch (Exception e) {
			json.failed("登录异常！");
			logger.error("登录异常！", e);
			e.printStackTrace();
			throw new SYSException(e);
		}
		return json;
	}

	/**
	 * 退出返回登录页面
	 * 
	 * @author wyw
	 * @date:2016年9月25日 下午8:28:19
	 * @return
	 */
	@RequestMapping("/logout.do")
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			if(!response.isCommitted()){
//				response.sendRedirect(ContextPath.getAppBasePath(request) + "/login.jsp");
				response.sendRedirect(ContextPath.getAppBasePath(request) + "/home/toLogin.do");
			}
			// request.getRequestDispatcher("").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
