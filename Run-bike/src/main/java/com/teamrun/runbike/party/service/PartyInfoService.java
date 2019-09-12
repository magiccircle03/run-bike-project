package com.teamrun.runbike.party.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.PartyInfo;

@Service
public class PartyInfoService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	public int hasParty(int u_idx) {
		dao = template.getMapper(PartyDaoInterface.class);
		int resultCnt=dao.hasParty(u_idx);
		return resultCnt;
	}
	
	public int getPartyNum(int u_idx) {
		dao = template.getMapper(PartyDaoInterface.class);
		int resultCnt=dao.getPartyNum(u_idx);
		return resultCnt;
	}
	
	public PartyInfo getPartyInfoOne(int p_num){
		PartyInfo partyInfo = new PartyInfo();
		partyInfo = dao.getPartyInfoOne(p_num);
		return partyInfo;
	}
}
