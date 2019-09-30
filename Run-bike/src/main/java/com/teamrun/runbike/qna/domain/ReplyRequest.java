package com.teamrun.runbike.qna.domain;

public class ReplyRequest {

	
	private int rp_num;
	private String rp_title;
	private String rp_text;
	private String rp_writer;
	
	private int u_idx;
	private int q_num;

	
	
	public ReplyRequest() {}
	
	


	public ReplyRequest(int rp_num, String rp_title, String rp_text, String rp_writer, int u_idx, int q_num) {
		super();
		this.rp_num = rp_num;
		this.rp_title = rp_title;
		this.rp_text = rp_text;
		this.rp_writer = rp_writer;
		this.u_idx = u_idx;
		this.q_num = q_num;
	}




	public int getRp_num() {
		return rp_num;
	}


	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}


	public String getRp_title() {
		return rp_title;
	}


	public void setRp_title(String rp_title) {
		this.rp_title = rp_title;
	}


	public String getRp_text() {
		return rp_text;
	}


	public void setRp_text(String rp_text) {
		this.rp_text = rp_text;
	}


	public String getRp_writer() {
		return rp_writer;
	}


	public void setRp_writer(String rp_writer) {
		this.rp_writer = rp_writer;
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




//	public Reply toReply() {
//		Reply reply = new Reply();
//		reply.getU_idx();
//		reply.getRp_num();
//		reply.getRp_title();
//		reply.getRp_text();
//		reply.getRp_writer();
//		reply.getQ_num();
//		
//		System.out.println("ReplyRequest_ toReply() : "+reply);
//		
//		return reply;
//		
//	}
	
	
	public Reply toReply() { 
		Reply reply = new Reply(rp_num,rp_title,rp_text,rp_writer,null,q_num,u_idx);
		
		System.out.println(reply);
		  return reply;
		  }
	
	
	
	
	
	
}
