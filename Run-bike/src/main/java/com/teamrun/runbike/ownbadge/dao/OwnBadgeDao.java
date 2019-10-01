package com.teamrun.runbike.ownbadge.dao;

import java.util.List;

import com.teamrun.runbike.ownbadge.domain.Badge;

public interface OwnBadgeDao {

	//뱃지 넣기
	public int insertMyBadge(int b_num, int u_idx);
	
	//모든 뱃지 소환
	public List<Badge> selectAllBadge();
	
	//나의 뱃지 소환
	public List<Badge> selectMyBadge(int u_idx);
	
	//연속로그인 확인
	public int consecutiveLogin(int u_idx);
}
