package com.teamrun.runbike.party.domain;

public class ReadyInfo {
	int p_num;
	int u_idx;
	char readyYN;

	public ReadyInfo() {
	}
	
	public ReadyInfo(int p_num, int u_idx, char readyYN) {
		super();
		this.p_num = p_num;
		this.u_idx = u_idx;
		this.readyYN = readyYN;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public char getReadyYN() {
		return readyYN;
	}
	public void setReadyYN(char readyYN) {
		this.readyYN = readyYN;
	}
	
	@Override
	public String toString() {
		return "ReadyInfo [p_num=" + p_num + ", u_idx=" + u_idx + ", readyYN=" + readyYN + "]";
	}
}
