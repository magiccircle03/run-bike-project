package com.teamrun.runbike.mycourse.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.mycourse.dao.MyCourseDao;
import com.teamrun.runbike.mycourse.domain.MyCourse;

@Service("getMyCourseService")
public class GetMyCourseService {

	@Autowired
	private SqlSessionTemplate template;
	
	private MyCourseDao dao;
	
	public List<MyCourse> selectMyCourseList(int u_idx){
		
		dao = template.getMapper(MyCourseDao.class);
		
		List<MyCourse> myCourseList = dao.selectMyCourseList(u_idx);
		
		return myCourseList;
	}
}
