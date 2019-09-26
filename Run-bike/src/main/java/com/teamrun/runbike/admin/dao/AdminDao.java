package com.teamrun.runbike.admin.dao;

import java.util.List;

import com.teamrun.runbike.user.domain.UserInfo;

public interface AdminDao {

		
		// 회원 정보 삭제
		public int memberDeleteAdmin(int u_idx);

		// 회원의 전체 리스트 
		public List<UserInfo> selectAllListAdmin();
	

	
}
