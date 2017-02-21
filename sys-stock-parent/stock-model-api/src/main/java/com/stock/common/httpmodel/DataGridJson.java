package com.stock.common.httpmodel;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @ClassName:  DataGridJson   
 * @Description:TODO(后台向前台返回JSON)   
 * @author: user  
 * @date:   2016年6月2日 下午5:29:40   
 *
 */
public class DataGridJson implements Serializable {

	private static final long serialVersionUID = -8209601516691755782L;
	private Long total;// 总记录数
	private List<?> rows;// 每行记录

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}


}
