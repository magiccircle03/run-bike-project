package com.teamrun.runbike.record.domain;

import java.util.List;

public class RentBikeStatus {
	private int list_total_count;
	private RESULT RESULT;
	private List<Row> row;
	public int getList_total_count() {
		return list_total_count;
	}
	public void setList_total_count(int list_total_count) {
		this.list_total_count = list_total_count;
	}
	public RESULT getRESULT() {
		return RESULT;
	}
	public void setRESULT(RESULT rESULT) {
		RESULT = rESULT;
	}
	public List<Row> getRow() {
		return row;
	}
	public void setRow(List<Row> row) {
		this.row = row;
	}
	public RentBikeStatus(int list_total_count, com.teamrun.runbike.record.domain.RESULT rESULT, List<Row> row) {
		super();
		this.list_total_count = list_total_count;
		RESULT = rESULT;
		this.row = row;
	}
	public RentBikeStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "RentBikeStatus [list_total_count=" + list_total_count + ", RESULT=" + RESULT + ", row=" + row + "]";
	}
	
	
	
	
}
