package com.teamrun.runbike.ownstamp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.ownstamp.dao.OwnStampDao;
import com.teamrun.runbike.ownstamp.domain.Stamp;
import com.teamrun.runbike.user.domain.LoginInfo;

@Service("ownStampService")
public class GetOwnStampService {

	@Autowired
	private SqlSessionTemplate template;
	
	private OwnStampDao dao;
	
	public List<Stamp> getAllStamp() {
		
		dao = template.getMapper(OwnStampDao.class);
		
		//전체 스탬프 리스트	
		List<Stamp> allStampList = null; 
		allStampList = dao.selectAllStamp();
		 
		return allStampList;
	}
	
	public List<Stamp> selectMyStamp(HttpServletRequest request) {
		
		dao = template.getMapper(OwnStampDao.class);
		
		List<Stamp> stampList = null;
		
		//세션에서 로그인 정보 받아오기
		LoginInfo loginInfo = (LoginInfo)request.getSession(false).getAttribute("loginInfo");
				
		int u_idx = loginInfo.getU_idx();
		
		stampList = dao.selectMyStamp(u_idx);
		
		return stampList;
	}
	
}
