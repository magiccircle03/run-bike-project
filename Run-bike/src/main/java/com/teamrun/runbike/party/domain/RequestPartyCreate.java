package com.teamrun.runbike.party.domain;

import java.util.Date;

public class RequestPartyCreate {

	private String p_name;
	private String p_start_info;
	private String p_end_info;
	//private String p_XY;//원본 json 데이터(스트링으로 받나..?)
	//출발지 x좌표
	//출발지 x좌표
	//도착지 y좌표
	//도착지 y좌표
	private Date p_time;
	private int p_capacity;
	private String p_content;
	private String p_password;
	
	public RequestPartyCreate() {
		super();
	}


	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_start_info() {
		return p_start_info;
	}

	public void setP_start_info(String p_start_info) {
		this.p_start_info = p_start_info;
	}

	public String getP_end_info() {
		return p_end_info;
	}

	public void setP_end_info(String p_end_info) {
		this.p_end_info = p_end_info;
	}

	public Date getP_time() {
		return p_time;
	}

	public void setP_time(Date p_time) {
		this.p_time = p_time;
	}

	public int getP_capacity() {
		return p_capacity;
	}

	public void setP_capacity(int p_capacity) {
		this.p_capacity = p_capacity;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}


	public String getP_password() {
		return p_password;
	}

	public void setP_password(String p_password) {
		this.p_password = p_password;
	}
	

	//좌표 없는 상태의 to스트링
	@Override
	public String toString() {
		return "RequestCreateParty [p_name=" + p_name + ", p_start_info=" + p_start_info + ", p_end_info=" + p_end_info
				+ ", p_time=" + p_time + ", p_capacity=" + p_capacity + ", p_content=" + p_content
				+ ", p_password=" + p_password + "]";
	}
	
}
