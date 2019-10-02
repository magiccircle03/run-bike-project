package com.teamrun.runbike.qna.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {

	
	private int q_num;
	private int u_idx;
	private String q_title;
	private String q_content;
	private String q_writer;
	private Date regdate;
	

//	private String message_regdate;
//	
//	
//	//날짜 재설정
//	SimpleDateFormat setDate = new SimpleDateFormat("yyyy.MM.DD HH:mm:ss");
//	
//	
//	public String getMessage_regdate() {
//		return message_regdate;
//	}
//
//	public void setMessage_regdate(Date message_regdate) {
//		this.message_regdate = setDate.format(message_regdate);
//	}




	public Message() {
	}
	



	public Message(int q_num, int u_idx, String q_title, String q_content, String q_writer, Date regdate) {
		super();
		this.q_num = q_num;
		this.u_idx = u_idx;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_writer = q_writer;
		this.regdate = new Date();
		
	}
	


	public int getQ_num() {
		return q_num;
	}


	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}


	public int getU_idx() {
		return u_idx;
	}


	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}


	public String getQ_title() {
		return q_title;
	}


	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}


	public String getQ_content() {
		return q_content;
	}


	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}


	public String getQ_writer() {
		return q_writer;
	}


	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}




	@Override
	public String toString() {
		return "Message [q_num=" + q_num + ", u_idx=" + u_idx + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_writer=" + q_writer + ", regdate=" + regdate + "]";
	}

	
	


	


	
	
	
	
}
