package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.RequestParticipationInsert;
import com.teamrun.runbike.party.domain.RequestPartyCreate;

@Service
public class PartyCreateService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	// 파티 테이블에 insert한다
	public int partyInsert(RequestPartyCreate requestPartyCreate) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.insertParty(requestPartyCreate);
		//System.out.println(resultCnt);
		//System.out.println("키"+requestPartyCreate.getKey());
		return Integer.parseInt(requestPartyCreate.getKey());
	}
	

}
