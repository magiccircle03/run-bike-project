package com.teamrun.runbike.party.dao;

import java.util.List;

import com.teamrun.runbike.party.domain.PartyInfo;
import com.teamrun.runbike.party.domain.RequestPartyCreate;

public interface PartyDaoInterface {
	// 방 만들기
	public int insertParty(RequestPartyCreate requestPartyCreate);
	// 모든 방 가져오기
	public List<PartyInfo> selectAllPartyList();
	
}
