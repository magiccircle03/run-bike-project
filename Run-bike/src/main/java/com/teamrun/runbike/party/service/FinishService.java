package com.teamrun.runbike.party.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.FinishInfo;
import com.teamrun.runbike.party.domain.ReadyInfo;
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
	
	public int isEnd(int u_idx, int p_num) {
		int result=-1;
		dao = template.getMapper(PartyDaoInterface.class);
		result = dao.isEnd(u_idx, p_num);
		System.out.println(">>끝났는지 :"+result);
		return result;
	}
	
}
