package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;

@Service
public class PartyDeleteService {
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	public int deleteParty(int p_num) {
		int resultCnt=0;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.deleteParty(p_num);
		return resultCnt;
	}
}
