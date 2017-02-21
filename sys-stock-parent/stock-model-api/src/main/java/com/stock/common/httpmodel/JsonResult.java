package com.stock.common.httpmodel;

/**
 * json封装
 * @author wyw
 * @date:2016年10月7日 下午6:18:33
 */
public class JsonResult {
	
	public static final int STATUS_SUCCESS = 1; //状态，1-默认成功；2-失败 ;
	public static final int STATUS_FAILED  = 2; //状态，1-默认成功；2-失败 ;

	/**
	 * 状态：默认成功
	 */
	private int status = STATUS_SUCCESS;//状态
	private Object data = null;//需要传输的数据
	private String msg ;//提示信息

	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	public void failed(String msg){
		this.status = STATUS_FAILED;
		this.msg = msg;
	}
	
	
	

}
