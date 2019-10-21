package com.teamrun.runbike.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;
import com.teamrun.runbike.qna.domain.ListViewTest;
import com.teamrun.runbike.qna.domain.Message;
import com.teamrun.runbike.qna.domain.SearchParam;

@Service("boardlistservice")
public class BoardListService2 {

	
	private BoardDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	final int BOARD_LIST = 7;
	
	public ListViewTest getBoardData(int currentPageNumber,SearchParam searchParam) {
	
	dao = template.getMapper(BoardDaoInterface.class);
	
	ListViewTest listData = new ListViewTest();
	
	//현재 페이지 번호
	listData.setCurrentPageNumber(currentPageNumber);
	
	int totalCnt = dao.selectTotalCount(searchParam);
	
	int totalPageCnt = 0;
	
	if(totalCnt>0) {
		totalPageCnt = totalCnt/BOARD_LIST;
		if(totalCnt%BOARD_LIST>0) {
			totalPageCnt++;
		}
	}
	listData.setPageTotalCount(totalPageCnt);
	
	int index = (currentPageNumber-1)*BOARD_LIST;
	
	List<Message> boardlistList = null;
	
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("search", searchParam);
	params.put("index", index);
	params.put("count", BOARD_LIST);
	
	boardlistList = dao.selectList(params);
	System.out.println("회원 총인원 : " + totalCnt);
	System.out.println("회원리스트 admin 사이즈 : " + boardlistList.size());
	
	listData.setBoardlistList(boardlistList);
	for(Message m : boardlistList) {
		System.out.println(m);
	}
	

	int no = totalCnt - index;
	listData.setNo(no);
	
	listData.setTotalCount(totalCnt);
	


	return listData;
		
}
	
	public List<Message> getAllListTest(){
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		List<Message> list = dao.selectAllList();
		
		return list;
		
	}
	
	
	
	
}
