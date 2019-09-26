package com.teamrun.runbike.mycourse.dao;

import java.util.List;
import java.util.Map;

import com.teamrun.runbike.mycourse.domain.MyCourse;

public interface MyCourseDao {

	public int insertMyCourse(MyCourse myCourse);
	
	public List<MyCourse> selectMyCourseList(int u_idx);
	
	public List<MyCourse> selectMyCourseByPage(Map<String, Object> params);
	
	public int getTotalCount(int u_idx);
	
	public int changeMyCourse(MyCourse myCourse);
	
	public int deleteMyCourse(int mc_idx);
	
}
