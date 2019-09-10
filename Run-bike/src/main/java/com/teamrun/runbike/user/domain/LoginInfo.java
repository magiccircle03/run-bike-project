package com.teamrun.runbike.user.domain;

import java.util.Date;

public class LoginInfo {
	private int u_idx;
	// 회원 아이디 - 이메일주소
	private String u_id;
	private String u_name;
	// 회원 프로필 사진 - 회원 정보에서는 string값으로 받아 저장할 것.
	private String u_photo;
	// 가입일 - 자동 생성
	private Date regdate;
	
	public LoginInfo(int u_idx, String u_id, String u_name, String u_photo, Date regdate) {
		this.u_idx = u_idx;
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_photo = u_photo;
		this.regdate = regdate;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_photo() {
		return u_photo;
	}
	public void setU_photo(String u_photo) {
		this.u_photo = u_photo;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "LoginInfo [u_idx=" + u_idx + ", u_id=" + u_id + ", u_name=" + u_name + ", u_photo=" + u_photo
				+ ", regdate=" + regdate + "]";
	}
	
}
