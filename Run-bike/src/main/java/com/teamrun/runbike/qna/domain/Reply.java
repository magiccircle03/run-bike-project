package com.teamrun.runbike.qna.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Reply {
	
	//답글 번호
	private int rp_num;
	//답글 제목
	private String rp_title;
	//답글 내용
	private String rp_text;
	//답글 작성자
	private String rp_writer;
	//날짜
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yy.MM.dd HH:mm", timezone="GMT+18")
	private Date rp_regdate;
	
	//원글 번호
	private int q_num;
	//글작성시 관리자 확인을 위한 idx
	private int u_idx;
	
	
	public Reply() {
		this.rp_regdate = new Date();
	}


	


	public Reply(int rp_num, String rp_title, String rp_text, String rp_writer, Date rp_regdate, int q_num, int u_idx) {
		super();
		this.rp_num = rp_num;
		this.rp_title = rp_title;
		this.rp_text = rp_text;
		this.rp_writer = rp_writer;
		this.rp_regdate = rp_regdate;
		this.q_num = q_num;
		this.u_idx = u_idx;
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


	public Date getRp_regdate() {
		return rp_regdate;
	}


	public void setRp_regdate(Date rp_regdate) {
		this.rp_regdate = rp_regdate;
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





	@Override
	public String toString() {
		return "Reply [rp_num=" + rp_num + ", rp_title=" + rp_title + ", rp_text=" + rp_text + ", rp_writer="
				+ rp_writer + ", rp_regdate=" + rp_regdate + ", q_num=" + q_num + ", u_idx=" + u_idx + "]";
	}


	
	
	
	

}
