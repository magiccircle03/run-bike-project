package com.teamrun.runbike.admin.dao;

import java.util.List;
import java.util.Map;

import com.teamrun.runbike.admin.domain.SearchParam;
import com.teamrun.runbike.user.domain.UserInfo;

public interface AdminDao {

		
		// 회원 정보 삭제
		public int memberDeleteAdmin(int u_idx);

		// 회원의 전체 리스트 
		public List<UserInfo> selectAllListAdmin();
		
		
		//회원행 총 갯수
		public int selectTotalCount(SearchParam searchParam);
		//회원 총 리스트(페이징)
		public List<UserInfo> selectList(Map<String, Object> params);
		
	

	
}
