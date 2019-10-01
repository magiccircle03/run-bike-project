package com.teamrun.runbike.qna.domain;

public class RequestMemberEdit {

	
	private int u_idx;
	private String q_title;
	private String q_content;
	private String q_writer;
	private int q_num;
	

	
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
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
	


	@Override
	public String toString() {
		return "RequestMemberEdit [u_idx=" + u_idx + ", q_title=" + q_title + ", q_content=" + q_content + ", q_writer="
				+ q_writer + ", q_num=" + q_num + "]";
	}
	
	
	public Message toMessage() {
		Message info = new Message();
		
		info.setU_idx(u_idx); 
		info.setQ_num(q_num);
		info.setQ_writer(q_writer);
		info.setQ_title(q_title);
		info.setQ_content(q_content);
		
		System.out.println(info);
		
		return info;
	}
	
	
	
	
	
	
	
	
}
