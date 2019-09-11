package com.teamrun.runbike.party.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.PartyInfo;

@Service
public class PartyListService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	// 종료여부에 관계 없이 모든 방의 정보를 가져오는 메소드
	public List<PartyInfo> getAllList() {
		dao = template.getMapper(PartyDaoInterface.class);
		List<PartyInfo> list = dao.selectAllPartyList();
		return list;
	}

	// 종료된 방의 정보만 가져오는 메소드 
	public List<PartyInfo> getAllListClosedY() {
		dao = template.getMapper(PartyDaoInterface.class);
		List<PartyInfo> list = dao.selectAllPartyListClosedY();
		return list;
	}
	
	// 종료되지 않은 방의 정보만 가져오는 메소드 
	public List<PartyInfo> getAllListClosedN() {
		dao = template.getMapper(PartyDaoInterface.class);
		List<PartyInfo> list = dao.selectAllPartyListClosedN();
		return list;
	}
	
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
	
}
