package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.ReadyInfo;
@Service
public class ReadyService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	// 참여 테이블을 바꾼다.
	public int updateReady(ReadyInfo readyInfo) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.updateReady(readyInfo);

		return resultCnt;
	}
	
	//
	public int getNotReadyUsercount(int p_num) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.getNotReadyUsercount(p_num);
		return resultCnt;
	}
}
