package com.teamrun.runbike.user.domain;

import java.util.Date;
import java.util.Map;

public class LoginLogInfo {
	private String u_idx;
	private Date login_date;
	
	public LoginLogInfo() {
		
	}
	
	public LoginLogInfo(String u_idx, Date login_date) {
		this.u_idx = u_idx;
		this.login_date = new Date();
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public Date getLogin_date() {
		return login_date;
	}


	public void setLogin_date(Date login_date) {
		this.login_date = login_date;
	}


	@Override
	public String toString() {
		return "LoginLogInfo [u_idx=" + u_idx + ", login_date=" + login_date + "]";
	}
	
	
}
