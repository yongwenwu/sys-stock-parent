package com.stock.common.httpmodel;

import java.io.Serializable;

/**
 * 
 * @ClassName:  DataGridModel   
 * @Description:TODO(主要是前台 使用 bootstrap-table 组件 向后台传递参数 主要封装了分页 排序等参数)   
 * @author: user  
 * @date:   2016年6月3日 下午2:10:23   
 *
 */
public class DataGridModel implements Serializable {
	private static final long serialVersionUID = -2637491594603675063L;
	private int limit = 10;// 分页大小
	private int offset = 0;// 游标偏移量
	private String sort = null;// 排序字段名
	private String order = "";// 按什么排序(asc,desc)

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		StringBuilder sb = new StringBuilder();
		if(sort != null && !"".equals(sort)){
	        for (int i = 0; i < sort.length(); i++) {
	            if (Character.isUpperCase(sort.charAt(i))) {
	                sb.append("_"+ String.valueOf(sort.charAt(i)).toLowerCase());
	            }else{
	            	sb.append(sort.charAt(i));
	            }
	        }
		}
		this.sort = sb.toString();
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

}
