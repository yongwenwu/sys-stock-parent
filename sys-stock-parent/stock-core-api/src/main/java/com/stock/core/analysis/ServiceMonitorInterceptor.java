package com.stock.core.analysis;


import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("productServiceMonitorInterceptor")
public class ServiceMonitorInterceptor implements MethodInterceptor {

	private static final Logger logger = Logger.getLogger("SERVICE_EXECUTETIME");

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		String packageName = invocation.getMethod().getDeclaringClass().getPackage().getName();
		String className = invocation.getMethod().getDeclaringClass().getSimpleName();
		String methodName = className + "." + invocation.getMethod().getName();
		long beginTime = System.currentTimeMillis();
		try {
			Object res = invocation.proceed();
			return res;
		} catch (Exception e) {
			throw e;
		} finally {
			long elapseTime = System.currentTimeMillis() - beginTime;
			logger.info(packageName + "." + methodName + "|" + elapseTime);
		}
	}

}
