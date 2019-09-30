package com.teamrun.runbike.qna.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;

@Service("ReplyDeleteService")
public class ReplyDeleteService {

	
private BoardDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	
	public int ReplyDelete(int rp_num) {
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		return dao.replyDelete(rp_num);
	}
	
	
	
}
