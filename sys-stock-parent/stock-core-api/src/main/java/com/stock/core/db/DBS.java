package com.stock.core.db;

/**
 * 
 * 数据库名称对应枚举类
 * 
 * @author Administrator
 * 
 */
public enum DBS {

	PRODUCT("elp_product"),DB_AUTH("db_auth"), DEFAULT("elp_product");

	private String dbName;

	private DBS(String dbName) {
		this.dbName = dbName;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

}
