package com.stock.core.analysis;


import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 对每个request请求做时间统计
 * 
 * @author Administrator
 *
 */
public class ExecuteTimeInterceptor implements HandlerInterceptor {
	
	private static final Logger EXECUTETIMELOG = LoggerFactory.getLogger("CONTROLLER_EXECUTETIME");
	
	@Override
	@SuppressWarnings("rawtypes")
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object object, Exception ex)
			throws Exception {
		String url = request.getRequestURI();
		if(url.indexOf(".do")<=0){
			return ;
		}
		long endTime = System.currentTimeMillis();
		long startTime = ExecuteTimeHolder.getTime();
		long consumeTime = endTime - startTime;
		StringBuffer requestQueryString = new StringBuffer();
	
		Map paraMap = request.getParameterMap();
		Set keySet = paraMap.keySet();
		Iterator it = keySet.iterator();
		while (it.hasNext()) {
			String paraName = (String) it.next();
			String paraValue = ((String[]) paraMap.get(paraName))[0];
			requestQueryString.append(paraName + "=" + paraValue);
			if (it.hasNext()) {
				requestQueryString.append("&");
			}
		}
		EXECUTETIMELOG.info(request.getRequestURI() + "," + consumeTime + "," + requestQueryString.toString() );
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object object, ModelAndView mav) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
		ExecuteTimeHolder.setTime(System.currentTimeMillis());
		return true;
	}
	

}
