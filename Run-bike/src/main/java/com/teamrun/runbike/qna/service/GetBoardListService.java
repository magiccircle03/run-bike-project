package com.teamrun.runbike.qna.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;
import com.teamrun.runbike.qna.domain.BoardListView;
import com.teamrun.runbike.qna.domain.Message;

@Service("boardpageService")
public class GetBoardListService implements BoardService {

	@Autowired
	private SqlSessionTemplate template;
	
	private BoardDaoInterface dao;
	
	// 1. 한페이지에 보여줄 게시글의 개수
	private static final int BOARD_COUNT_PER_PAGE = 5;
	
	public BoardListView getBoardListView(int pageNumber) {
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		int currentPageNumber = pageNumber;
		
		BoardListView view = null;
		
		int messageTotalCount = dao.selectCount();
		
		List<Message> messageList = null;
		int firstRow = 0;
		int endRow = 0;
		
		if(messageTotalCount >0) {

			firstRow = (pageNumber-1)*BOARD_COUNT_PER_PAGE + 1;
			endRow = firstRow + BOARD_COUNT_PER_PAGE -1;
			
			//messageList = dao.selectList(conn, firstRow, endRow);
			//messageList = dao.selectList(firstRow, endRow);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("firstRow", firstRow);
			params.put("endRow", endRow);
			messageList = dao.selectList(params);
			
		} else {
			currentPageNumber = 0;
			messageList = Collections.emptyList();						
		}
		
		view  = new BoardListView(
				messageTotalCount, 
				currentPageNumber, 
				messageList, 
				BOARD_COUNT_PER_PAGE, 
				firstRow, 
				endRow);
		
		return view;
		
		
		
	}
		
	
	
	
}
