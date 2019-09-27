package com.teamrun.runbike.user.dao;

import java.util.List;
import java.util.Map;

import com.teamrun.runbike.user.domain.UserInfo;

public interface UserDao {
	public int insertUser(UserInfo userInfo);
	public int chkVerify(String u_id, String u_code);
	public UserInfo selectUserById(String u_id);
	public int insertLoginDate(int u_idx);
	public int chkLoginLog(Map<String, Object> param);
	public int editUser(UserInfo userInfo);
	public int chkLeave(int u_idx);
	public boolean selectLeaveById(String u_id);
	public String chkMaster(int u_idx);
	public Map<String, Object> getRecord(int u_idx);
	public List<Map<String, Object>> getRecentRecord(int u_idx);
	public int updateIsSns(int u_idx);
}
