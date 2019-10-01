package com.teamrun.runbike.ownbadge.dao;

import java.util.List;

import com.teamrun.runbike.ownbadge.domain.Badge;
import com.teamrun.runbike.ownbadge.domain.MyBadge;

public interface OwnBadgeDao {

	//뱃지 넣기
	public int insertMyBadge(int b_num, int u_idx);
	
	//모든 뱃지 소환
	public List<Badge> selectAllBadge();
	
	//나의 뱃지 소환
	public List<MyBadge> selectMyBadge(int u_idx);
	
	//연속로그인 확인
	public int consecutiveLogin(int u_idx);
	
	//방문 일자수 확인
	public int firstLogin(int u_idx);
	
	//혼자 라이딩 km수 확인
	public int ridingAloneDistance(int u_idx);
	
	//같이 라이딩 km수 확인
	public int ridingWithDistance(int u_idx);
	
	//혼자라이딩 타임 확인
	public int ridingAloneTime(int u_idx);
	
	//얻은 스탬프 수 확인
	public int myOwnStampCount(int u_idx);
	
	//방장 횟수 확인
	public int isMasterCount(int u_idx);
	
	public int isMyBadge(int u_idx, int b_num);
}
