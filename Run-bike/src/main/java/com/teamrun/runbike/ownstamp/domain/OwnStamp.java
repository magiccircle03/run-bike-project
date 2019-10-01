package com.teamrun.runbike.ownstamp.domain;

public class OwnStamp {

	private int s_num;
	private int u_idx;
	
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	@Override
	public String toString() {
		return "OwnStamp [s_num=" + s_num + ", u_idx=" + u_idx + "]";
	}	
}
