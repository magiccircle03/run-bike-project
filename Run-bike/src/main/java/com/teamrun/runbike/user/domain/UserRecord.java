package com.teamrun.runbike.user.domain;

public class UserRecord {
	private double totalKm;
	private double totalCount;
	private double avgKm;
	private double avgTime;
	public double getTotalKm() {
		return totalKm;
	}
	public void setTotalKm(double totalKm) {
		this.totalKm = totalKm;
	}
	public double getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(double totalCount) {
		this.totalCount = totalCount;
	}
	public double getAvgKm() {
		return avgKm;
	}
	public void setAvgKm(double avgKm) {
		this.avgKm = avgKm;
	}
	public double getAvgTime() {
		return avgTime;
	}
	public void setAvgTime(double avgTime) {
		this.avgTime = avgTime;
	}
	
	public UserRecord(double totalKm, double totalCount, double avgKm, double avgTime) {
		super();
		this.totalKm = totalKm;
		this.totalCount = totalCount;
		this.avgKm = avgKm;
		this.avgTime = avgTime;
	}
	
	public UserRecord() {}
	
	@Override
	public String toString() {
		return "UserRecord [totalKm=" + totalKm + ", totalCount=" + totalCount + ", avgKm=" + avgKm + ", avgTime="
				+ avgTime + "]";
	}
	
	
}
