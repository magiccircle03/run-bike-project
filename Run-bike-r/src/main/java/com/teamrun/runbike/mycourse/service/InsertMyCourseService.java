package com.teamrun.runbike.mycourse.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.mycourse.dao.MyCourseDao;
import com.teamrun.runbike.mycourse.domain.MyCourse;
import com.teamrun.runbike.mycourse.domain.RegMyCourse;
import com.teamrun.runbike.user.domain.LoginInfo;

@Service("insertmyCourseService")
public class InsertMyCourseService {

	@Autowired
	private SqlSessionTemplate template;
	
	private MyCourseDao dao;
	
	public int insertMyCourse(RegMyCourse regMyCourse, HttpServletRequest request) {
		
		dao = template.getMapper(MyCourseDao.class);
		
		MyCourse myCourse = regMyCourse.toMyCourse();
		
		LoginInfo loginInfo = (LoginInfo)request.getSession(false).getAttribute("loginInfo");
		int u_idx = loginInfo.getU_idx();
		
		System.out.println("::::::::::::::::::::::::::::::::u_idx=" + u_idx);
		
		myCourse.setU_idx(u_idx);
		
		System.out.println(myCourse);
		
		int rCnt = dao.insertMyCourse(myCourse);
		
		return rCnt;
	}
}
