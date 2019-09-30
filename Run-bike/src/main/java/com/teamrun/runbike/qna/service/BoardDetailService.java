package com.teamrun.runbike.qna.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;
import com.teamrun.runbike.qna.domain.Message;

@Service("detailService")
public class BoardDetailService {
	
	
	private BoardDaoInterface dao;
	@Inject
	private SqlSessionTemplate template;


	public Message getDetaildata(int q_num) {
		

		
		dao = template.getMapper(BoardDaoInterface.class);
		
		Message message = dao.detail(q_num);
		
		return message;
	}

}




