package com.stock.core.db;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.PatternMatchUtils;

import com.stock.core.constants.CommonConstant;


public class DynamicDataSourceInterceptor implements MethodInterceptor{
	
	private static final Logger logger = LoggerFactory.getLogger(DynamicDataSourceInterceptor.class);
	
	private Map<String,List<String>> attributeSource = new HashMap<String, List<String>>();

	public Object invoke(MethodInvocation invocation) throws Throwable {
		Method method = invocation.getMethod();
		String methodName = method.getName();
		String selectDb = DBS.DEFAULT.getDbName();
		DBSelector dbSelector = method.getAnnotation(DBSelector.class);
		if(dbSelector != null){
			selectDb = dbSelector.value().getDbName();
		}
		List<String> matchList = attributeSource.get(selectDb);
		String mskey = CommonConstant.DB_DEFAULT_PROTOCL;
		for (String value : matchList) {
			String mappedName = value.split(",")[0];
			if (isMatch(methodName, mappedName)) {
				mskey = value.split(",")[1];
				break;
			}
		}
		
		String finalDbKey = selectDBConvertor(selectDb, mskey , true);
		
		logger.debug("methodName: " + methodName + " , match protocl is {" + selectDb + " , " + mskey +" } . final select DB is " + finalDbKey);
		if (null != finalDbKey) {
			DynamicDataSourceKeyHolder.setKey(finalDbKey);
		}
		return invocation.proceed();
	}

	private boolean isMatch(String methodName, String mappedName) {
		return PatternMatchUtils.simpleMatch(mappedName, methodName);
	}

	public Map<String,List<String>> getAttributeSource() {
		return attributeSource;
	}

	public void setAttributeSource(Map<String,List<String>> attributeSource) {
		this.attributeSource = attributeSource;
	}
	
	public String selectDBConvertor(String selectDb , String msKey , boolean userDbFlag){
		StringBuilder sb = new StringBuilder();
		sb.append(selectDb).append(CommonConstant.DB_SEPARATOR).append(msKey);
		if(userDbFlag){
			sb.append(CommonConstant.DB_SEPARATOR).append(CommonConstant.BD_FLAG);
		}
		return sb.toString();
	}
}
