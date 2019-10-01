package com.teamrun.runbike.party.domain;

public class FinishInfo {
	int p_num;
	int u_idx;
	char finishYN;

	public FinishInfo() {
	}
	
	public FinishInfo(int p_num, int u_idx, char finishYN) {
		super();
		this.p_num = p_num;
		this.u_idx = u_idx;
		this.finishYN = finishYN;
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
	public char getfinishYN() {
		return finishYN;
	}
	public void setfinishYN(char finishYN) {
		this.finishYN = finishYN;
	}
	
	@Override
	public String toString() {
		return "ReadyInfo [p_num=" + p_num + ", u_idx=" + u_idx + ", finishYN=" + finishYN + "]";
	}
}
