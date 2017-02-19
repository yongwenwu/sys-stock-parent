package com.stock.web.demo.service;

import com.stock.web.demo.model.Demo;

/**
 * 接口类
 * @ClassName: DemoService
 * @Description:
 * @author wyw
 * @date: 2017年2月17日 下午6:19:05
 *
 */
public interface DemoService {
	
	/**
	 * 根据id获取数据
	 * @Title: getDemoById
	 * @Description: 
	 * @param id
	 * @return
	 * @author: wyw
	 * @date: 2017年2月17日 下午6:21:23
	 */
	public Demo getDemoById(Long id);
	

}
