package com.teamrun.runbike.party.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RequestPartyEdit {
	private int p_num;
	private String p_name;
	private String p_start_info;
	private String p_end_info;
	private String p_XY;
	private Date p_time;
	private String p_time_f;
	private int p_capacity;
	private String p_content;
	private String p_password;
	private double p_riding_km;
	private double p_riding_time;
	
	SimpleDateFormat f = new SimpleDateFormat("yyyy.MM.dd aaa hh:mm");
	

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
	public String getP_time_f() {
		return f.format(p_time);
	}
	public void setP_time_f(Date p_time) {
		this.p_time_f = f.format(p_time);
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
	public double getP_riding_km() {
		return p_riding_km;
	}
	public void setP_riding_km(double p_riding_km) {
		this.p_riding_km = p_riding_km;
	}
	public double getP_riding_time() {
		return p_riding_time;
	}
	public void setP_riding_time(double p_riding_time) {
		this.p_riding_time = p_riding_time;
	}
	
	@Override
	public String toString() {
		return "RequestPartyEdit [p_num=" + p_num + ", p_name=" + p_name + ", p_start_info=" + p_start_info
				+ ", p_end_info=" + p_end_info + ", p_XY=" + p_XY + ", p_time=" + p_time + ", p_time_f=" + p_time_f
				+ ", p_capacity=" + p_capacity + ", p_content=" + p_content + ", p_password=" + p_password
				+ ", p_riding_km=" + p_riding_km + ", p_riding_time=" + p_riding_time + ", f=" + f + "]";
	}
}
