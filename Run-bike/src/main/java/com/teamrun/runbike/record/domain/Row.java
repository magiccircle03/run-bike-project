package com.teamrun.runbike.record.domain;

public class Row {

	private int rackTotCnt;
	private String stationName;
	private int parkingBikeTotCnt;
	private int shared;
	private float stationLatitude;
	private float stationLongitude;
	private String stationId;
	public int getRackTotCnt() {
		return rackTotCnt;
	}
	public void setRackTotCnt(int rackTotCnt) {
		this.rackTotCnt = rackTotCnt;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	public int getParkingBikeTotCnt() {
		return parkingBikeTotCnt;
	}
	public void setParkingBikeTotCnt(int parkingBikeTotCnt) {
		this.parkingBikeTotCnt = parkingBikeTotCnt;
	}
	public int getShared() {
		return shared;
	}
	public void setShared(int shared) {
		this.shared = shared;
	}
	public float getStationLatitude() {
		return stationLatitude;
	}
	public void setStationLatitude(float stationLatitude) {
		this.stationLatitude = stationLatitude;
	}
	public float getStationLongitude() {
		return stationLongitude;
	}
	public void setStationLongitude(float stationLongitude) {
		this.stationLongitude = stationLongitude;
	}
	public String getStationId() {
		return stationId;
	}
	public void setStationId(String stationId) {
		this.stationId = stationId;
	}
	public Row(int rackTotCnt, String stationName, int parkingBikeTotCnt, int shared, float stationLatitude,
			float stationLongitude, String stationId) {
		super();
		this.rackTotCnt = rackTotCnt;
		this.stationName = stationName;
		this.parkingBikeTotCnt = parkingBikeTotCnt;
		this.shared = shared;
		this.stationLatitude = stationLatitude;
		this.stationLongitude = stationLongitude;
		this.stationId = stationId;
	}
	public Row() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SeoulBike [rackTotCnt=" + rackTotCnt + ", stationName=" + stationName + ", parkingBikeTotCnt="
				+ parkingBikeTotCnt + ", shared=" + shared + ", stationLatitude=" + stationLatitude
				+ ", stationLongitude=" + stationLongitude + ", stationId=" + stationId + "]";
	}
	
	
}
