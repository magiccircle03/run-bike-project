package com.teamrun.runbike.qna.domain;

public class RequestMemberWrite {

	private String q_writer;
	private String q_title;
	private String q_content;
	private int u_idx;    //회원번호
	private int q_num;
	

	
	
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

	public String getQ_writer() {
		return q_writer;
	}

	public void setQ_writer(String q_write) {
		this.q_writer = q_write;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}


	  
	


	/*
	 * public Message toMessage() { Message message = new
	 * Message(0,u_idx,q_title,q_content, q_writer,null); return message; }
	 */
	 


	
	public Message toMessage() { 
		  Message message = new Message(q_num,u_idx,q_title,q_content, q_writer,null);
		  return message;
		  }

	@Override
	public String toString() {
		return "RequestMemberWrite [q_writer=" + q_writer + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", u_idx=" + u_idx + ", q_num=" + q_num + "]";
	}

	
	

}
