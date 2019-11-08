package com.teamrun.runbike.record.domain;

public class SeoulBikeList {
	private RentBikeStatus RentBikeStatus;

	public RentBikeStatus getRentBikeStatus() {
		return RentBikeStatus;
	}

	public void setRentBikeStatus(RentBikeStatus rentBikeStatus) {
		RentBikeStatus = rentBikeStatus;
	}

	public SeoulBikeList(RentBikeStatus rentBikeStatus) {
		super();
		RentBikeStatus = rentBikeStatus;
	}

	public SeoulBikeList() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "SeoulBikeList [RentBikeStatus=" + RentBikeStatus + "]";
	}
}
