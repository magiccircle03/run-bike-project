package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.RequestPartyCreate;

@Service
public class CreatePartyService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	public int partyInsert(RequestPartyCreate requestPartyCreate) {
		int resultCnt = -1;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.insertParty(requestPartyCreate);
		
		return resultCnt;
	}
}
