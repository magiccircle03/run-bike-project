package com.teamrun.runbike.user.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.user.dao.UserDao;
import com.teamrun.runbike.user.domain.LoginInfo;
import com.teamrun.runbike.user.domain.UserInfo;

@Service("loginService")
public class LoginService implements UserService {
	@Autowired
	private SqlSessionTemplate template;
	
	private UserDao dao;
	
	public int login(String u_id, String u_pw,HttpServletRequest request) {
		
		// 이메일 인증 = 2
		// 이메일 미인증 = 1
		// 로그인 실패 = 0
		
		int loginChk = 0;
		UserInfo userInfo = null;
		dao = template.getMapper(UserDao.class);
		
		userInfo = dao.selectUserById(u_id);
		
		// 회원 아이디가 존재 && 비밀번호 일치시 세션에 값 저장.
		if(userInfo.checkPW(u_pw) && userInfo !=null) {
			if(userInfo.isU_verify()) {
				LoginInfo loginInfo = userInfo.toLoginInfo();
				request.getSession(true).setAttribute("loginInfo",loginInfo);
				loginChk = 2;
			} else {
				loginChk = 1;
				request.getSession(true).setAttribute("reEmail",userInfo.getU_id());
			}			
		} 

		return loginChk;
	}
}
