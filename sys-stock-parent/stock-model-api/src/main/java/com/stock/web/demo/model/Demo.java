package com.stock.web.demo.model;

import java.io.Serializable;

/**
 * 模型
 * 
 * @ClassName: Demo
 * @Description:
 * @author wyw
 * @date: 2017年2月17日 下午6:11:59
 *
 */
public class Demo implements Serializable {
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 8203091097911536484L;
	private Long id; //id
	private String name; //姓名
	private int age; //年龄

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}
