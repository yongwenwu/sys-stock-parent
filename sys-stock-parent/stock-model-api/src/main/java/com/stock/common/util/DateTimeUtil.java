package com.stock.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	/**
	 * 根据字符串返回日期
	 * @author wyw
	 * @date:2016年9月25日 下午9:17:26
	 * @param str
	 * @return
	 */
	public static Date getDate(String str){
		String s = StringUtil.getString(str);
		if(!"".equals(s)){
			try{
				return dateFormat.parse(s);
			}catch(Exception e){
				return null;
			}
		}
		return null;
	}
	/**
	 * 根据指定格式获取日期
	 * @author wyw
	 * @date:2016年9月25日 下午9:16:34
	 * @param str
	 * @param format
	 * @return
	 */
	public static Date getDate(Object str,String format){
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String s = StringUtil.getString(str);
		if(!"".equals(s)){
			try{
				return sdf.parse(s);
			}catch(Exception e){
				return null;
			}
		}
		return null;
	}
	
	/**
	 * 取得的时间串，格式为 yyyy-MM-dd HH:mm:ss
	 * 
	 * @return
	 */
	public static String getDateTimeStr(Date date) {
		if (date == null) {
			return getCurDateTimeStr();
		}
		return dateFormat.format(date);
	}
	/**
	 * 取得当前的时间，格式为 yyyy-MM-dd HH:mm:ss
	 * 
	 * @return
	 */
	public static String getCurDateTimeStr() {
		return dateFormat.format(new Date());
	}
	
	

}
