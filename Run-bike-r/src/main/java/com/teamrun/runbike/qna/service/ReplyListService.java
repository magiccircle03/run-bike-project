package com.teamrun.runbike.qna.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;
import com.teamrun.runbike.qna.domain.Reply;


@Service
public class ReplyListService implements BoardService{
	
	@Autowired
	private SqlSessionTemplate template;
	
	private BoardDaoInterface dao;

	
	
	
	//답변글 리스트
	public List<Reply> replyListData(int q_num){
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		List<Reply> list = dao.selectReplyListAll(q_num);
		
		System.out.println("답변리스트 서비스:"+list);
		
		return list;
	}
	
	
}
