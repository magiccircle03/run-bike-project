package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.FinishInfo;
@Service
public class FinishService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	// 참여 테이블을 바꾼다.
	public int updateFinish(FinishInfo finishInfo) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.updateFinish(finishInfo);

		return resultCnt;
	}
	
	// 해당 유저가 끝났는지 
	public int isEnd(int u_idx, int p_num) {
		int result=-1;
		dao = template.getMapper(PartyDaoInterface.class);
		result = dao.isEnd(u_idx, p_num);
		return result;
	}
	
	// 아직 종료하지 않은 유저의 수를 구해온다 
	public int getNotEndUsercount(int p_num) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.getNotEndUsercount(p_num);
		return resultCnt;
	}
	
	// 해당 파티를 종료한다
	public int endParty(int p_num) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.endParty(p_num);
		return resultCnt;
	}
	
}
