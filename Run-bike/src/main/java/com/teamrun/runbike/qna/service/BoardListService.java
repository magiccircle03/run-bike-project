package com.teamrun.runbike.qna.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;
import com.teamrun.runbike.qna.domain.ListViewBoardData;
import com.teamrun.runbike.qna.domain.Message;
import com.teamrun.runbike.qna.domain.SearchParam;


@Service("boardlistService")
public class BoardListService implements BoardService{
	
	// 자동 메퍼 이용해 생성할 dao
	private BoardDaoInterface dao; 

	@Autowired
	private SqlSessionTemplate template;

	// 1. 한페이지에 보여줄 게시글의 개수
	final int MESSAGE_COUNT_PER_PAGE = 5;
	
	
	public ListViewBoardData getListData(int pgNum, SearchParam searchParam) {
		
		// dao 생성
		dao = template.getMapper(BoardDaoInterface.class);
		
		ListViewBoardData pagelistdata = new ListViewBoardData();
		
		       
		
		//현재 페이지 번호
		pagelistdata.setCurrentPageNumber(pgNum);
		
		//전체 게시물 개수
		int totalCnt = dao.selectTotalCount(searchParam);
		
		int totalPageCnt=0;
		
		if(totalCnt>0) {
			totalPageCnt = totalCnt/MESSAGE_COUNT_PER_PAGE;
			if(totalCnt%MESSAGE_COUNT_PER_PAGE>0) {
				totalPageCnt++;
			}
		}
		pagelistdata.setPageTotalCount(totalPageCnt);
		
		int index = (pgNum-1)*MESSAGE_COUNT_PER_PAGE;
		
		List<Message> boardList = null;  
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("search", searchParam);
		params.put("index", index);
		params.put("count",  MESSAGE_COUNT_PER_PAGE);
		
		//memberList = dao.selectList(index, MEMBER_CNT_List);
		boardList = dao.selectList(params);
		
		System.out.println("사이즈 : : : : " + totalCnt);
		System.out.println("리스트 사이즈 : : : : " + boardList.size());
		

		
		pagelistdata.setBoardList(boardList);
		int no = totalCnt - index;
		
		pagelistdata.setNo(no);
		
		return pagelistdata;

	
}
		
		
		
	
		
	
	
	
	
	
	//게시글 전체리스트 출력 
	public List<Message> getAllList(){
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		List<Message> list = dao.selectAllList();
		
		return list;
		
	}
	
	
	
	/*
	 * 
	 * //답글+게시글 리스트 public List<Message> replyList(){
	 * 
	 * dao = template.getMapper(BoardDaoInterface.class);
	 * 
	 * List<Message> list = dao.replyList(); return list; }
	 * 
	 */

	
	
	

}
