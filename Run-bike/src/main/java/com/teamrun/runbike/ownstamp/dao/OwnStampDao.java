package com.teamrun.runbike.ownstamp.dao;

import java.util.List;

import com.teamrun.runbike.ownstamp.domain.Stamp;

public interface OwnStampDao {
	
	public int insertMyStamp(int s_num, int u_idx);
	
	//전체 스탬프 가져오기(흑백)
	public List<Stamp> selectAllStamp();
	
	//내가 가지고 있는 스탬프 목록 가져오기
	public List<Stamp> selectMyStamp(int u_idx);
}
