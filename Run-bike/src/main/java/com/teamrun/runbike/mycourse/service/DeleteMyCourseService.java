package com.teamrun.runbike.mycourse.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.mycourse.dao.MyCourseDao;

@Service("deleteMyCourseService")
public class DeleteMyCourseService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MyCourseDao dao;
	
	public int deleteService(int mc_idx){
		
		dao = template.getMapper(MyCourseDao.class);
		
		int rCnt = dao.deleteMyCourse(mc_idx);
		
		return rCnt;
	}

}
