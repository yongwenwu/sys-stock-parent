package com.stock.common.exception;
/**
 * 
 * @ClassName:  SYSException   
 * @Description:统一异常   
 * @author: 
 * @date:   2016年7月28日 下午3:52:20   
 *
 */
public class SYSException extends Exception {

	private static final long serialVersionUID = -262378565732280706L;

	@SuppressWarnings("unused")
	private Object writeLogObj = null;

	private final boolean isWrite = false;
	static {
		// init isWrite status
	}

	public SYSException() {
		super();
	}

	public SYSException(String message, Throwable cause) {
		super(message, cause);
	}

	public SYSException(String message) {
		super(message);
	}

	public SYSException(Throwable cause) {
		super(cause);
	}

	public SYSException(Exception exception) {
		super(exception);
	}

	public SYSException(Exception exception, Object writeLogObj) {
		super(exception);
		this.writeLogObj = isWrite;
	}

}
