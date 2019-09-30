package com.teamrun.runbike.ownbadge.domain;

public class Badge {

	private int b_num; //뱃지 고유 번호
	private String b_name; //뱃지명
	private String b_photo; //뱃지사진
	private String bc_photo; //뱃지흑백사진
	
	//Getter and Setter
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_photo() {
		return b_photo;
	}
	public void setB_photo(String b_photo) {
		this.b_photo = b_photo;
	}
	public String getBc_photo() {
		return bc_photo;
	}
	public void setBc_photo(String bc_photo) {
		this.bc_photo = bc_photo;
	}
	
	//확인 위한 toString()
	@Override
	public String toString() {
		return "Badge [b_num=" + b_num + ", b_name=" + b_name + ", b_photo=" + b_photo + ", bc_photo=" + bc_photo + "]";
	}
}
