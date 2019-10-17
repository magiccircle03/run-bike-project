package com.teamrun.runbike.qna.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;
import com.teamrun.runbike.qna.domain.Message;
import com.teamrun.runbike.qna.domain.RequestMemberWrite;


@Service("writeService")
public class BoardWriteService implements BoardService {
	

	@Autowired
	private SqlSessionTemplate template;
	
	private BoardDaoInterface dao;
	
	
	
	//게시글 입력
	public int write(RequestMemberWrite regRequest) {
		
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		Message message = regRequest.toMessage();
		
		System.out.println("문의글 작성 서비스 : "+message);
		
		int rCnt = dao.insertBoard(message);
		
		//dao.numsameupdate(message.getQ_num());   //원글번호와 답글그룹번호가 같게
		
		return rCnt;	
		
	}
	
	
	
	
	
	
	
	/* 답글---------------------------------- */
	
	//해당원글 번호로 정보가져오기

	//	public Message getboardFormData(int q_num) {
			
	//		dao = template.getMapper(BoardDaoInterface.class);
			
	//		Message message = dao.replyselectbyqnum(q_num);
			
	//		return message;
	//	}

		
		
	//답글 입력
	//public int replywrite(HttpServletRequest request, RequestMemberWrite replyRequest) {
		
	//	dao = template.getMapper(BoardDaoInterface.class);
		
	//	Message message = replyRequest.toMessage();
		
		//업데이트를 먼저하고 insert
	//	dao.replyUpdate(message.getQ_num());  //답글작성시 원글번호가 해당 글번호와 같을떄 step을 1 증가시킨다.

	//	int rCnt = dao.replyInsert(message);
		
	//	return rCnt;
	//}
	
	
	
	
	
	
	/*
	 * 
	 * //답글 입력 public int replywrite(HttpServletRequest request, RequestReply
	 * replyRequest) {
	 * 
	 * dao = template.getMapper(BoardDaoInterface.class);
	 * 
	 * Message message = replyRequest.toMessage();
	 * 
	 * //업데이트를 먼저하고 insert dao.replyUpdate(message.getQ_num()); //답글작성시 원글번호가 해당
	 * 글번호와 같을떄 step을 1 증가시킨다.
	 * 
	 * int rCnt = dao.insertBoard(message);
	 * 
	 * return rCnt; }
	 */


}







