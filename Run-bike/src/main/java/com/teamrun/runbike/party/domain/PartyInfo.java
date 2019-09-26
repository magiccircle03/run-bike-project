package com.teamrun.runbike.party.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class PartyInfo {
	private int p_num;
	private String p_name;
	private String p_start_info;
	private String p_end_info;
	private String p_XY; //출발지,도착지 x,y좌표
	private Date p_time;
	private int p_capacity;
	private String p_content;
	private Date p_generate_date;
	private Double p_riding_km;
	private Double p_riding_time;
	private Date p_start_time;
	private Date p_end_time;
	private String p_password;
	private char p_closedYN;
	
	// 날짜타입 출력 쉽게 포맷팅한 변수들
	private String p_time_f;
	private String p_generate_date_f;
//	private String p_start_time_f;
//	private String p_end_time_f;

	
	SimpleDateFormat f = new SimpleDateFormat("yyyy.MM.dd aaa hh:mm E요일");
	
	public PartyInfo() {
		super();
	}
	
	// 사용자가 입력한 정보로 방을 만들 때 사용하는 생성자
	public PartyInfo(String p_name, String p_start_info, String p_end_info, String p_XY, Date p_time, int p_capacity,
			String p_content, String p_password) {
		super();
		this.p_name = p_name;
		this.p_start_info = p_start_info;
		this.p_end_info = p_end_info;
		this.p_XY = p_XY;
		this.p_time = p_time;
		this.p_capacity = p_capacity;
		this.p_content = p_content;
		this.p_generate_date = new Date();
		this.p_password = p_password;
	}
	
	// 제이슨 형식으로 바꿔 반환하는 메서드

	/* 게터와 세터 */

	public int getP_num() {
		return p_num;
	}


	public void setP_num(int p_num) {
		this.p_num = p_num;
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


	public String getP_XY() {
		return p_XY;
	}



	public void setP_XY(String p_XY) {
		this.p_XY = p_XY;
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



	public Date getP_generate_date() {
		return p_generate_date;
	}



	public void setP_generate_date(Date p_generate_date) {
		this.p_generate_date = p_generate_date;
	}



	public Double getP_riding_km() {
		return p_riding_km;
	}



	public void setP_riding_km(Double p_riding_km) {
		this.p_riding_km = p_riding_km;
	}



	public Double getP_riding_time() {
		return p_riding_time;
	}



	public void setP_riding_time(Double p_riding_time) {
		this.p_riding_time = p_riding_time;
	}



	public Date getP_start_time() {
		return p_start_time;
	}



	public void setP_start_time(Date p_start_time) {
		this.p_start_time = p_start_time;
	}



	public Date getP_end_time() {
		return p_end_time;
	}



	public void setP_end_time(Date p_end_time) {
		this.p_end_time = p_end_time;
	}



	public String getP_password() {
		return p_password;
	}



	public void setP_password(String p_password) {
		this.p_password = p_password;
	}



	public char getP_closedYN() {
		return p_closedYN;
	}



	public void setP_closedYN(char p_closedYN) {
		this.p_closedYN = p_closedYN;
	}
	
	// 날짜타입 포매팅
	public String getP_time_f() {
		return f.format(p_time);
	}

	public void setP_time_f(Date p_time) {
		this.p_time_f = f.format(p_time);
	}
	
	public String getP_generate_date_f() {
		return f.format(p_generate_date);
	}

	public void setP_generate_date_f(Date p_generate_date) {
		this.p_generate_date_f = f.format(p_generate_date);
	}

//	public String getP_start_time_f() {
//		return f.format(p_start_time);
//	}
//
//	public void setP_start_time_f(Date p_start_time) {
//		this.p_start_time_f = f.format(p_start_time);
//	}
//
//	public String getP_end_time_f() {
//		return f.format(p_end_time);
//	}
//
//	public void setP_end_time_f(Date p_end_time) {
//		this.p_end_time_f = f.format(p_end_time);
//	}


}
