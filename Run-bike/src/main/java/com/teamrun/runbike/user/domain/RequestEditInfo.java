package com.teamrun.runbike.user.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestEditInfo {
	private String u_name;
	private String u_pw;
	private MultipartFile u_photo;
	private String oldPhoto;
	
	
	public RequestEditInfo(String u_name, String u_pw, MultipartFile u_photo, String oldPhoto) {
		super();
		this.u_name = u_name;
		this.u_pw = u_pw;
		this.u_photo = u_photo;
		this.oldPhoto = oldPhoto;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public MultipartFile getU_photo() {
		return u_photo;
	}
	public void setU_photo(MultipartFile u_photo) {
		this.u_photo = u_photo;
	}
	public String getOldPhoto() {
		return oldPhoto;
	}
	public void setOldPhoto(String oldPhoto) {
		this.oldPhoto = oldPhoto;
	}
	@Override
	public String toString() {
		return "RequestEditInfo [u_name=" + u_name + ", u_pw=" + u_pw + ", u_photo=" + u_photo + ", oldPhoto="
				+ oldPhoto + "]";
	}
	
	public UserInfo toUserInfo(int u_idx, String u_id) {
		UserInfo userInfo = new UserInfo();
		userInfo.setU_idx(u_idx);
		userInfo.setU_name(u_name);
		userInfo.setU_pw(u_pw);
		userInfo.setU_id(u_id);
		
		return userInfo;
	}
	
}
