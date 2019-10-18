package com.teamrun.runbike.record.domain;

public class RESULT {
	private String CODE;
	private String MESSAGE;
	public String getCode() {
		return CODE;
	}
	public void setCode(String CODE) {
		this.CODE = CODE;
	}
	public String getMessage() {
		return MESSAGE;
	}
	public void setMessage(String MESSAGE) {
		this.MESSAGE = MESSAGE;
	}
	public RESULT(String CODE, String MESSAGE) {
		super();
		this.CODE = CODE;
		this.MESSAGE = MESSAGE;
	}
	public RESULT() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Result [code=" + CODE + ", message=" + MESSAGE + "]";
	}
	
	
}
