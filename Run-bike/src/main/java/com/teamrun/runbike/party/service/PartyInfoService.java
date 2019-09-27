package com.teamrun.runbike.party.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.PartyInfo;
import com.teamrun.runbike.party.domain.PartyUserInfo;

@Service
public class PartyInfoService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	// 시작 시간 설정
	public int updatePartyStartTime(int p_num) {
		System.out.println("start 서비스 들어옴");
		dao = template.getMapper(PartyDaoInterface.class);
		int resultCnt = dao.updatePartyStartTime(p_num);
		System.out.println("start 서비스 resultCnt"+resultCnt);
		return resultCnt;
	}
	
	
	// 현재 회원이 속한 파티가 있는지 확인한다
	public int hasParty(int u_idx) {
		dao = template.getMapper(PartyDaoInterface.class);
		int resultCnt=dao.hasParty(u_idx);
		return resultCnt;
	}
	
	// 현재 회원이 속한 파티 번호를 가져온다
	public int getPartyNum(int u_idx) {
		dao = template.getMapper(PartyDaoInterface.class);
		int resultCnt=dao.getPartyNum(u_idx);
		return resultCnt;
	}
	
	// 해당 방의 정보를 가져온다
	public PartyInfo getPartyInfoOne(int p_num){
		dao = template.getMapper(PartyDaoInterface.class);
		PartyInfo partyInfo = new PartyInfo();
		partyInfo = dao.getPartyInfoOne(p_num);
		return partyInfo;
	}
	
	// 해당 방에 참여한 회원의 정보를 가져온다.
	public List<PartyUserInfo> getPartyUserList(int p_num) {
		dao = template.getMapper(PartyDaoInterface.class);
		List<PartyUserInfo> list = dao.getPartyUserList(p_num);
		return list;
	}
	
	// 해당 방의 참여인원을 가져온다
	public int getPartyUserCount(int p_num) {
		int userCnt=-1;
		dao = template.getMapper(PartyDaoInterface.class);
		userCnt = dao.getPartyUserCount(p_num);
		return userCnt;
	}
	
	// 해당 방의 마스터 회원 번호를 가져온다 
	public int getPartyMasterIdx(int p_num) {
		int idx=0;
		dao = template.getMapper(PartyDaoInterface.class);
		idx = dao.getPartyMasterIdx(p_num);
		return idx;
	}
	
}
