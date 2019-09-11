package com.teamrun.runbike.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.user.dao.UserDao;
import com.teamrun.runbike.user.domain.UserInfo;

@Service("verifyService")
public class VerifyService implements UserService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	private UserDao dao;
	
	public String verify(String u_id,String u_code) {
		
		dao = template.getMapper(UserDao.class);
		
		int result = dao.chkVerify(u_id, u_code);
		
		return result > 0 ? "ok" : "no";
	}
	
	
}
