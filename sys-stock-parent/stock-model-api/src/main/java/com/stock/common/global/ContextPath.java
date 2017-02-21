/**  
 * @Title:  ContextPath.java   
 * @Description:TODO(用一句话描述该文件做什么)   
 * @version V1.0     
 */
package com.stock.common.global;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @ClassName: ContextPath
 * @Description:上下文tag
 * @date: 2016年8月12日 下午4:57:21
 * 
 */
public class ContextPath extends TagSupport {
	private static final long serialVersionUID = 1L;
	
	@Override
	public int doStartTag() throws JspException {
		try {
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			this.pageContext.getOut().write(getAppBasePath(request));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	
	/**
	 * 获取应用路径如：http://localhost:8086/stock/
	 * @param request
	 * @return
	 */
	public static String getAppBasePath(HttpServletRequest request) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
		return basePath;
	}

}
