package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.RequestPartyEdit;

@Service
public class PartyEditService {

	private PartyDaoInterface dao;

	@Inject
	private SqlSessionTemplate template;

	public int editParty(RequestPartyEdit editRequest) {
		int resultCnt = 0;
		dao = template.getMapper(PartyDaoInterface.class);
		resultCnt = dao.editParty(editRequest);
		return resultCnt;
	}

}
