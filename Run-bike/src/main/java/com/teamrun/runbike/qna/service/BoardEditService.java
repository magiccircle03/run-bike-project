package com.teamrun.runbike.qna.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;
import com.teamrun.runbike.qna.domain.Message;
import com.teamrun.runbike.qna.domain.RequestMemberEdit;

@Service("editService")
public class BoardEditService implements BoardService{

	
	private BoardDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;


	
	//수정폼가져오기
	public Message getEditFormData(int q_num) {
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		Message message = dao.selectMessageByNum(q_num);
		
		return message;
	}
	
	
	
	//수정하기
	public int edit(RequestMemberEdit editRequest, HttpServletRequest request) {

		dao = template.getMapper(BoardDaoInterface.class);
		
		System.out.println("BoardEditService: "+editRequest);
		
		
		
		Message message = editRequest.toMessage();
		
		System.out.println("수정서비스 :"+message);
		
		int rCnt = dao.boardUpdate(message);
		return rCnt;
	}
	
	
	
	
	
	
}
