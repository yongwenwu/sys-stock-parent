package com.stock.core.analysis;



/**
 * 
 * controller request请求时间ThreadLocal类
 * 
 * @author Administrator
 *
 */
public class ExecuteTimeHolder {
	
	private static ThreadLocal<Long> timeHolder = new ThreadLocal<Long>();
	
	public static void setTime(Long time){
		timeHolder.set(time);
	}
	
	public static Long getTime(){
		return timeHolder.get();
	}
}
