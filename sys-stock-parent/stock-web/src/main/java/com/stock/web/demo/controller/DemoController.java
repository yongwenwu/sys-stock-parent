package com.stock.web.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stock.web.demo.model.Demo;
import com.stock.web.demo.service.DemoService;


/**
 * 测试
 * @ClassName: Demo
 * @Description:
 * @author wyw
 * @date: 2017年2月17日 下午5:17:37
 *
 */
@Controller
@RequestMapping("/demo")
public class DemoController {
	
	@Autowired
	DemoService demoServic; 
	
//	DemoServiceImpl demoServic= new DemoServiceImpl();
	@RequestMapping("/demoTest.do")
	public ModelAndView demoTest(HttpServletRequest request, ModelAndView modelAndView){
		modelAndView.setViewName("/demo/demo");
		System.out.println("demo测试……");
		Demo demo = demoServic.getDemoById(222L);
		System.out.println("id：" + demo.getId() + "  name：" +demo.getName() + "  age：" + demo.getAge());
		return modelAndView;
	}
	
	

}
