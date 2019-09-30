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
		
		
		// 이전 dao에서는 검색 처리를 위한 여러개의 메서드가 필요.	
		// 게시물의 개수 : 동적 쿼리로 검색의 결과 까지 처리
		public int selectTotalCount(SearchParam searchParam);
		// 게시물의 LIST :  동적 쿼리로 검색의 결과 까지 처리
		//public List<MemberInfo> selectList(int index, int count);
		public List<UserInfo> selectList(Map<String, Object> params);
		
	

	
}
