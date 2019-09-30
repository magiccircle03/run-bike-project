package com.teamrun.runbike.qna.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;
import com.teamrun.runbike.qna.domain.Reply;
import com.teamrun.runbike.qna.domain.ReplyRequest;

@Service("ReplyWriteService")
public class ReplyWriteService {

	
	@Autowired
	private SqlSessionTemplate template;
	
	private BoardDaoInterface dao;
	
	
	
	//답변글 입력
	public int replywrite(ReplyRequest replyRequest,HttpServletRequest request) {
		
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		Reply replyinfo = replyRequest.toReply();
		
		System.out.println("답변 작성 서비스 : "+replyinfo);
		
		int rCnt = dao.replywrite(replyinfo);
		return rCnt;	
		
	}
	
}
