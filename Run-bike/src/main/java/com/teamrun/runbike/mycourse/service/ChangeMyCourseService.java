package com.teamrun.runbike.mycourse.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.mycourse.dao.MyCourseDao;
import com.teamrun.runbike.mycourse.domain.MyCourse;

@Service("changeMyCourseService")
public class ChangeMyCourseService {

	@Autowired
	private SqlSessionTemplate template;
	
	private MyCourseDao dao;
	
	public int changeMyCourse(MyCourse myCourse) {
		
		dao = template.getMapper(MyCourseDao.class);
		
		int rCnt = dao.changeMyCourse(myCourse);
		
		System.out.println(myCourse.toString());
		System.out.println("check::::: " + rCnt);
		
		return rCnt;
	}

}
