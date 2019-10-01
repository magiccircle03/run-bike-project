package com.teamrun.runbike.party.domain;

public class RequestParticipationInsert {
	private int u_idx;
	private int p_num;
	private char pc_masterYN;
	
	
	public RequestParticipationInsert() {
		super();
	}
	
	
	public RequestParticipationInsert(int u_idx, int p_num, char pc_masterYN) {
		this.u_idx = u_idx;
		this.p_num = p_num;
		this.pc_masterYN = pc_masterYN;
	}


	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public char getPc_masterYN() {
		return pc_masterYN;
	}
	public void setPc_masterYN(char pc_masterYN) {
		this.pc_masterYN = pc_masterYN;
	}
	
	
}
