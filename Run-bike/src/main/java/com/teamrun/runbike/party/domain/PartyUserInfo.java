package com.teamrun.runbike.party.domain;

public class PartyUserInfo {
	int pc_num;
	int u_idx;
	int p_num;
	char pc_masterYN;
	char pc_finishYN;
	char pc_readyYN;
	char pc_endYN;
	String u_id;
	String u_name;
	String u_photo;
	// 일단 이렇게만 해보고 오류나면 처리하기
	public PartyUserInfo() {
		
	}
	
	public PartyUserInfo(int pc_num, int u_idx, int p_num, char pc_masterYN, char pc_finishYN, char pc_readyYN,
			char pc_endYN, String u_id, String u_name, String u_photo) {
		super();
		this.pc_num = pc_num;
		this.u_idx = u_idx;
		this.p_num = p_num;
		this.pc_masterYN = pc_masterYN;
		this.pc_finishYN = pc_finishYN;
		this.pc_readyYN = pc_readyYN;
		this.pc_endYN = pc_endYN;
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_photo = u_photo;
	}

	public int getPc_num() {
		return pc_num;
	}

	public void setPc_num(int pc_num) {
		this.pc_num = pc_num;
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

	public char getPc_finishYN() {
		return pc_finishYN;
	}

	public void setPc_finishYN(char pc_finishYN) {
		this.pc_finishYN = pc_finishYN;
	}

	public char getPc_readyYN() {
		return pc_readyYN;
	}

	public void setPc_readyYN(char pc_readyYN) {
		this.pc_readyYN = pc_readyYN;
	}

	public char getPc_endYN() {
		return pc_endYN;
	}

	public void setPc_endYN(char pc_endYN) {
		this.pc_endYN = pc_endYN;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_photo() {
		return u_photo;
	}

	public void setU_photo(String u_photo) {
		this.u_photo = u_photo;
	}


	
}
