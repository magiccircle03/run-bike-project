package com.teamrun.runbike.ownstamp.domain;

public class MyStamp {

	private int s_num; //스탬프 고유 번호
	private String s_name; //스탬프 이름
	private String s_photo; //스탬프 사진
	private String cs_photo; //스탬프 흑백사진
	private double s_point_lon; //스탬프 시작포인트 lon
	private double s_point_lat; //스탬프 시작포인트 lat
	private int serial;
	
	
	//Getter and Setter
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_photo() {
		return s_photo;
	}
	public void setS_photo(String s_photo) {
		this.s_photo = s_photo;
	}
	public String getCs_photo() {
		return cs_photo;
	}
	public void setCs_photo(String cs_photo) {
		this.cs_photo = cs_photo;
	}
	public double getS_point_lon() {
		return s_point_lon;
	}
	public void setS_point_lon(double s_point_lon) {
		this.s_point_lon = s_point_lon;
	}
	public double getS_point_lat() {
		return s_point_lat;
	}
	public void setS_point_lat(double s_point_lat) {
		this.s_point_lat = s_point_lat;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	
	@Override
	public String toString() {
		return "MyStamp [s_num=" + s_num + ", s_name=" + s_name + ", s_photo=" + s_photo + ", cs_photo=" + cs_photo
				+ ", s_point_lon=" + s_point_lon + ", s_point_lat=" + s_point_lat + ", serial=" + serial + "]";
	}
	
	
}
