package com.teamrun.runbike.user.dao;

import com.teamrun.runbike.user.domain.UserInfo;

public interface UserDao {
	public int insertUser(UserInfo userInfo);
	public int chkVerify(String u_id, String u_code);
	public UserInfo selectUserById(String u_id);
}
