package com.teamrun.runbike.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.teamrun.runbike.admin.dao.AdminDao;
import com.teamrun.runbike.admin.domain.ListViewAdmin;
import com.teamrun.runbike.admin.domain.SearchParam;
import com.teamrun.runbike.user.domain.UserInfo;


@Service("memberlistservice")
public class MemberListService {

	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	final int MEMBER_ADMIN_List = 10;
	
	public ListViewAdmin getListData(int currentPageNumber,SearchParam searchParam) {
		
		dao = template.getMapper(AdminDao.class);
		
		ListViewAdmin listData = new ListViewAdmin();
		
		
		// 현재 페이지 번호
		listData.setCurrentPageNumber(currentPageNumber);
		
		// 전체 게시물의 개수
		int totalCnt = dao.selectTotalCount(searchParam);
		
		int totalPageCnt = 0;
		// 전체 페이지 개수
		if(totalCnt>0) {
			totalPageCnt = totalCnt/MEMBER_ADMIN_List;
			if(totalCnt%MEMBER_ADMIN_List>0) {
				totalPageCnt++;
			}
		}
		listData.setPageTotalCount(totalPageCnt);
		
		
		// 구간 검색을 위한 index
		int index = (currentPageNumber-1)*MEMBER_ADMIN_List;
		
		
		// 회원 정보 리스트 
		List<UserInfo> memberList = null;

		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("search", searchParam);
		params.put("index", index);
		params.put("count", MEMBER_ADMIN_List);
		

		memberList = dao.selectList(params);
		System.out.println("회원 총인원 : " + totalCnt);
		System.out.println("회원리스트 admin 사이즈 : " + memberList.size());
		
		listData.setMemberList(memberList);
		for(UserInfo m : memberList) {
			System.out.println(m);
		}
		

		int no = totalCnt - index;
		listData.setNo(no);
		
		listData.setTotalCount(totalCnt);
		

	
	return listData;
	
}
		
	
	
	
	public List<UserInfo> getAllListAdmin(){
		
		dao = template.getMapper(AdminDao.class);
		
		List<UserInfo> list = dao.selectAllListAdmin();
		
		return list;
		
	}
	
}
