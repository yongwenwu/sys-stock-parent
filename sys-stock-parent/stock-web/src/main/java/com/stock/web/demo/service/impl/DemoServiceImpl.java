package com.stock.web.demo.service.impl;

import org.springframework.stereotype.Service;

import com.stock.web.demo.model.Demo;
import com.stock.web.demo.service.DemoService;

/**
 * 实现类
 * @ClassName: DemoServiceImpl
 * @Description:
 * @author wyw
 * @date: 2017年2月17日 下午6:24:24
 *
 */
@Service("demoService")
public class DemoServiceImpl implements DemoService {

	@Override
	public Demo getDemoById(Long id) {
		Demo demo = new Demo();
		demo.setId(id);
		demo.setAge(20);
		demo.setName("张三");
		return demo;
	}

}
