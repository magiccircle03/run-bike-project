package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.RequestParticipationInsert;


@Service
public class PartyJoinService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	// 방 참여하기. 참여 테이블 insert한다
	public int insertParticipation(RequestParticipationInsert requestParticipationInsert) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.insertParticipation(requestParticipationInsert);
		return resultCnt;
	}
	
	// 방 나가기
	public int deleteParticipation(int p_num, int u_idx) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.deleteParticipation(p_num, u_idx);
		return resultCnt;
	}
	
	
}
