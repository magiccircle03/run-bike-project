package com.teamrun.runbike.ownstamp.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.ownstamp.dao.OwnStampDao;
import com.teamrun.runbike.ownstamp.domain.OwnStamp;
import com.teamrun.runbike.user.domain.LoginInfo;

@Service("insertOwnStampService")
public class InsertOwnStampService {

	@Autowired
	private SqlSessionTemplate template;
	private OwnStampDao dao;
	
	public int insertOwnStamp(int s_num, HttpServletRequest request) {
		
		dao = template.getMapper(OwnStampDao.class);
		
		OwnStamp ownStamp = new OwnStamp();
		
		//세션에서 로그인 정보 받아오기
		LoginInfo loginInfo = (LoginInfo)request.getSession(false).getAttribute("loginInfo");		
		int u_idx = loginInfo.getU_idx();
		System.out.println("u_idx:" + u_idx);
		ownStamp.setU_idx(u_idx);
		ownStamp.setS_num(s_num);
		
		int cnt = 0;
				
		cnt = dao.insertMyStamp(ownStamp);
		
		return cnt;
	}
}
