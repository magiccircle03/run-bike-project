package com.teamrun.runbike.user.domain;

import java.util.Date;
import java.util.Random;

import com.fasterxml.jackson.annotation.JsonIgnore;

// 회원 정보 클래스
public class UserInfo {
	// 회원 고유 idx
	private int u_idx;
	// 회원 아이디 - 이메일주소
	private String u_id;
	// 회원 비밀번호
	@JsonIgnore
	private String u_pw;
	// 회원 이름
	private String u_name;
	// 회원 프로필 사진 - 회원 정보에서는 string값으로 받아 저장할 것.
	private String u_photo;
	// 가입일 - 자동 생성
	private Date regdate;
	// 이메일 인증 여부 T/F
	private boolean u_verify;
	// 회원 인증 코드
	private String u_code;
	// 회원 sns 가입 여부 T/F
	private boolean u_sns;
	
	
	// 기본 생성자
	public UserInfo() {
		this.regdate = new Date();
		getRandomString();
	}
	
	
	public UserInfo(int u_idx, String u_id, String u_pw, String u_name) {
		this.u_idx = u_idx;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.regdate = new Date();
	}



	public UserInfo(int u_idx, String u_id, String u_pw, String u_name, String u_photo) {
		super();
		this.u_idx = u_idx;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_photo = u_photo;
		this.regdate = new Date();
	}



	public UserInfo(int u_idx, String u_id, String u_pw, String u_name, String u_photo, Date regdate, boolean u_verify,
			String u_code, boolean u_sns) {
		super();
		this.u_idx = u_idx;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_photo = u_photo;
		this.regdate = regdate;
		this.u_verify = u_verify;
		this.u_code = u_code;
		this.u_sns = u_sns;
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
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
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
	public boolean isU_verify() {
		return u_verify;
	}
	public void setU_verify(boolean u_verify) {
		this.u_verify = u_verify;
	}
	public String getU_code() {
		return u_code;
	}
	public void setU_code(String u_code) {
		this.u_code = u_code;
	}
	public boolean isU_sns() {
		return u_sns;
	}
	public void setU_sns(boolean u_sns) {
		this.u_sns = u_sns;
	}
	
	// 인스턴스 정보 확인용
	@Override
	public String toString() {
		return "UserInfo [u_idx=" + u_idx + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_photo="
				+ u_photo + ", regdate=" + regdate + ", u_verify=" + u_verify + ", u_code=" + u_code + ", u_sns="
				+ u_sns + "]";
	}
	
	// ajax 처리를 통한 비밀번호 체크 확인 메소드
	public boolean checkPW(String pw) {
		return u_pw != null && u_pw.trim().length()>0 && u_pw.equals(pw);
	}
	
	// 인증 코스 생성 메소드
	private void getRandomString() {
		Random r = new Random(System.nanoTime());
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<12; i++) {
			// true or false 랜덤 발생
			if(r.nextBoolean()) {
				sb.append(r.nextInt(10));
			}else {
				// 알파벳 랜덤 지정
				sb.append((char)(r.nextInt(26)+97));
			}
		}
		System.out.println("UserInfo - 난수코드 : "+sb);
		setU_code(sb.toString());
	}
	
	public LoginInfo toLoginInfo() {
		return new LoginInfo(u_idx,u_id,u_name,u_photo,regdate);
	}
}
