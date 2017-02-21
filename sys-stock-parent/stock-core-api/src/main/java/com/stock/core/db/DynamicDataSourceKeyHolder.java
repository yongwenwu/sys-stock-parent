package com.stock.core.db;


public class DynamicDataSourceKeyHolder {
	
	private static final ThreadLocal<String> dataSourceHolder = new ThreadLocal<String>();

	public static void setKey(String key) {
		dataSourceHolder.set(key);
	}

	public static String getDataSourceKey() {
		return dataSourceHolder.get();
	}
	
	public static void clearDataSourceKey(){
		dataSourceHolder.remove();
	}
}
