package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;

@Service
public class PartyMasterService {

	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	// 방장 위임
	public String changeMaster(int p_num, int u_idx) {
		dao = template.getMapper(PartyDaoInterface.class);
		int resultCnt1 = -1;
		int resultCnt2 = -1;
		// 트랜잭션 처리하기
		resultCnt1 = dao.resetMaster(p_num); // 해당 방의 방장을 초기화
		resultCnt2 = dao.setMaster(p_num, u_idx); // 넘어온 유저를 방장으로
		
		return (resultCnt1+resultCnt2==2)?"위임에 성공하였습니다. 당신은 자유의 몸입니다!!":"실패하였습니다. 방 장 님!";
	}
	
}
