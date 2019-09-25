package com.teamrun.runbike.record.domain;

import java.util.Date;

public class Record {
	private int r_idx;
	private int u_idx;
	private double r_riding_time;
	private double r_riding_km;
	private Date r_riding_date;
	private char r_finish;
	private double r_startPoint_lon;
	private double r_startPoint_lat;
	private double r_endPoint_lon;
	private double r_endPoint_lat;

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

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

	public Date getR_riding_date() {
		return r_riding_date;
	}

	public void setR_riding_date(Date r_riding_date) {
		this.r_riding_date = r_riding_date;
	}

	public char getR_finish() {
		return r_finish;
	}

	public void setR_finish(char r_finish) {
		this.r_finish = r_finish;
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

	public Record() {
		this.r_riding_date = new Date();
	}

	public Record(int r_idx, int u_idx, double r_riding_time, double r_riding_km, Date r_riding_date, char r_finish,
			double r_startPoint_lon, double r_startPoint_lat, double r_endPoint_lon, double r_endPoint_lat) {
		super();
		this.r_idx = r_idx;
		this.u_idx = u_idx;
		this.r_riding_time = r_riding_time;
		this.r_riding_km = r_riding_km;
		this.r_riding_date = r_riding_date;
		this.r_finish = r_finish;
		this.r_startPoint_lon = r_startPoint_lon;
		this.r_startPoint_lat = r_startPoint_lat;
		this.r_endPoint_lon = r_endPoint_lon;
		this.r_endPoint_lat = r_endPoint_lat;
	}

}
