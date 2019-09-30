package com.teamrun.runbike.qna.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.qna.dao.BoardDaoInterface;

@Service("boarddeleteService")
public class BoardDeleteService {
	
	
	private BoardDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	
	public int BoardDelete(int q_num) {
		
		dao = template.getMapper(BoardDaoInterface.class);
		
		return dao.boardDelete(q_num);
	}

}
