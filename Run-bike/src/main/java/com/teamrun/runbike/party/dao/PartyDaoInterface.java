package com.teamrun.runbike.party.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamrun.runbike.party.domain.FinishInfo;
import com.teamrun.runbike.party.domain.PartyInfo;
import com.teamrun.runbike.party.domain.PartyUserInfo;
import com.teamrun.runbike.party.domain.ReadyInfo;
import com.teamrun.runbike.party.domain.RequestParticipationInsert;
import com.teamrun.runbike.party.domain.RequestPartyCreate;
import com.teamrun.runbike.party.domain.RequestPartyEdit;

public interface PartyDaoInterface {
	// 방 만들기
	public int insertParty(RequestPartyCreate requestPartyCreate);

	// 모든 방 가져오기
	public List<PartyInfo> selectAllPartyList();

	// 종료된 모든 방 가져오기
	public List<PartyInfo> selectAllPartyListClosedY();
	
	// 종료되지 않은 모든 방 가져오기
	public List<PartyInfo> selectAllPartyListClosedN();
	
	// 참여하기
	public int insertParticipation(RequestParticipationInsert requestParticipationInsert);
	
	// 방 나가기
	public int deleteParticipation(@Param("p_num") int p_num, @Param("u_idx") int u_idx);
	
	// 해당회원 끝났는지 
	public int isEnd(@Param("u_idx") int u_idx, @Param("p_num") int p_num);
	
	// 진행중인 파티에 속해있는지 
	public int hasParty(int u_idx);	
	
	// 그 사람이 속한 파티의 번호 받아오기
	public int getPartyNum(int u_idx);
	
	// 파티 정보를 가져온다
	public PartyInfo getPartyInfoOne(int p_num);
	
	// 준비 상태 변경
	public int updateReady(ReadyInfo readyInfo);
	
	// 종료 상태 변경
	public int updateFinish(FinishInfo finishInfo);

	// 파티에 속한 유저 정보를 가져온다
	public List<PartyUserInfo> getPartyUserList(int p_num);

	// 파티에 속한 유저의 수를 가져온다
	public int getPartyUserCount(int p_num);
	
	// 해당 파티 마스터의 idx를 가져온다 
	public int getPartyMasterIdx(int p_num);
	
	// 해당 방의 방장을 초기화
	public int resetMaster(int p_num); 
	
	// 넘어온 유저를 방장으로
	public int setMaster(@Param("p_num") int p_num, @Param("u_idx") int u_idx); 
	
	// 방을 삭제한다
	public int deleteParty(int p_num);
	
	// 준비되지 않은 유저수 가져온다
	public int getNotReadyUsercount(int p_num);
	
	// 방 수정
	public int editParty(RequestPartyEdit requestPartyEdit);
	
	// 시작시간 업데이트 
	public int updatePartyStartTime(int p_num);
}
