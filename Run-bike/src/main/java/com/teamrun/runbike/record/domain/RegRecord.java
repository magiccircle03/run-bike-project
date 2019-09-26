package com.teamrun.runbike.record.domain;

public class RegRecord {

	private double r_riding_time;
	private double r_riding_km;
	private double r_startPoint_lon;
	private double r_startPoint_lat;
	private double r_endPoint_lon;
	private double r_endPoint_lat;
	public double getR_riding_time() {
		return r_riding_time;
	}
	public void setR_riding_time(double r_riding_time) {
		this.r_riding_time = r_riding_time;
	}
	public double getR_riding_km() {
		return r_riding_km;
	}
	public void setR_riding_km(double r_riding_km) {
		this.r_riding_km = r_riding_km;
	}
	public double getR_startPoint_lon() {
		return r_startPoint_lon;
	}
	public void setR_startPoint_lon(double r_startPoint_lon) {
		this.r_startPoint_lon = r_startPoint_lon;
	}
	public double getR_startPoint_lat() {
		return r_startPoint_lat;
	}
	public void setR_startPoint_lat(double r_startPoint_lat) {
		this.r_startPoint_lat = r_startPoint_lat;
	}
	public double getR_endPoint_lon() {
		return r_endPoint_lon;
	}
	public void setR_endPoint_lon(double r_endPoint_lon) {
		this.r_endPoint_lon = r_endPoint_lon;
	}
	public double getR_endPoint_lat() {
		return r_endPoint_lat;
	}
	public void setR_endPoint_lat(double r_endPoint_lat) {
		this.r_endPoint_lat = r_endPoint_lat;
	}
	
	public Record toRecord() {
		
		Record record = new Record();
		record.setR_riding_time(this.r_riding_time);
		record.setR_riding_km(this.r_riding_km);
		record.setR_startPoint_lon(this.r_startPoint_lon);
		record.setR_startPoint_lat(this.r_startPoint_lat);
		record.setR_endPoint_lon(this.r_endPoint_lon);
		record.setR_endPoint_lat(this.r_endPoint_lat);
		
		return record;
	}
	
	public RegRecord(double r_riding_time, double r_riding_km, double r_startPoint_lon, double r_startPoint_lat,
			double r_endPoint_lon, double r_endPoint_lat) {
		
		this.r_riding_time = r_riding_time;
		this.r_riding_km = r_riding_km;
		this.r_startPoint_lon = r_startPoint_lon;
		this.r_startPoint_lat = r_startPoint_lat;
		this.r_endPoint_lon = r_endPoint_lon;
		this.r_endPoint_lat = r_endPoint_lat;
	}
	
	public RegRecord() {
		
	}
	
	@Override
	public String toString() {
		return "RegRecord [r_riding_time=" + r_riding_time + ", r_riding_km=" + r_riding_km + ", r_startPoint_lon="
				+ r_startPoint_lon + ", r_startPoint_lat=" + r_startPoint_lat + ", r_endPoint_lon=" + r_endPoint_lon
				+ ", r_endPoint_lat=" + r_endPoint_lat + "]";
	}
	
}
