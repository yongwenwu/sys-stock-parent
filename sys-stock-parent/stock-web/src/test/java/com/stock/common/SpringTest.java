package com.stock.common;

import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 封装基于AbstractJUnit4SpringContextTests的测试基类 ，
 * 然后其他测试类只需要继承该类即可,可以省去每次都要绑定Application对象
 * @ClassName: SpringTest
 * @Description:
 * @author wyw
 * @date: 2017年2月22日 上午12:32:01
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-base.xml",
		"classpath:applicationContext-database-ref.xml",
		"classpath:applicationContext-database.xml"
		})
public class SpringTest extends AbstractJUnit4SpringContextTests {

	public <T> T getBean(Class<T> type) {
		return applicationContext.getBean(type);
	}

	public Object getBean(String beanName) {
		return applicationContext.getBean(beanName);
	}

	protected ApplicationContext getContext() {
		return applicationContext;
	}

}
