package com.teamrun.runbike.mycourse.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.mycourse.dao.MyCourseDao;
import com.teamrun.runbike.mycourse.domain.MyCourse;
import com.teamrun.runbike.mycourse.domain.RegMyCourse;

@Service("insertmyCourseService")
public class InsertMyCourseService {

	@Autowired
	private SqlSessionTemplate template;
	
	private MyCourseDao dao;
	
	public int insertMyCourse(RegMyCourse regMyCourse, HttpServletRequest request) {
		
		dao = template.getMapper(MyCourseDao.class);
		
		MyCourse myCourse = regMyCourse.toMyCourse();
		
		myCourse.setU_idx(71);
		
		System.out.println(myCourse);
		
		int rCnt = dao.insertMyCourse(myCourse);
		
		return rCnt;
	}
}
