package com.teamrun.runbike.user.service;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	@Autowired
	private SaveDateService dateService;
	
	private UserDao dao;
	
	public int login(String u_id, String u_pw,HttpServletRequest request) {
		// 이메일 인증 = 2
		// 이메일 미인증 = 1
		// 로그인 실패 = 0
		
		int loginChk = 0;
		UserInfo userInfo = null;
		boolean isLeave = false;
		dao = template.getMapper(UserDao.class);
		
		
		// 탈퇴한 회원인 지 아닌 지 확인 - 탈퇴 : 1 / 탈퇴 ㄴㄴ: 0
//		if(isLeave) {
//			loginChk = 3;
//		} else {
//			userInfo = dao.selectUserById(u_id);
//			
//			// 회원 아이디가 존재 && 비밀번호 일치시 세션에 값 저장.
//			if(userInfo.checkPW(u_pw) && userInfo !=null) {
//				if(userInfo.isU_verify()) {
//					// 이메일 인증 ok - 세션에 로그인 정보 저장
//					LoginInfo loginInfo = userInfo.toLoginInfo();
//					request.getSession(true).setAttribute("loginInfo",loginInfo);
//					// 날짜 이력 저장
//					
//					
//					dateService.saveDate(userInfo.getU_idx());
//					loginChk = 2;
//				} else {
//					// 이메일 인증 no - 세션에 이메일 정보 저장
//					loginChk = 1;
//					request.getSession(true).setAttribute("email",userInfo.getU_id());
//				}			
//			} else {
//				loginChk = 0;
//			}
//		}
		userInfo = dao.selectUserById(u_id);
		System.out.println("userInfo : "+userInfo);
		
		if(userInfo !=null && userInfo.checkPW(u_pw)) {
			isLeave = dao.selectLeaveById(u_id);	
			if(isLeave) {
				loginChk=3;
			} else {
				if(userInfo.isU_verify()) {
					LoginInfo loginInfo = userInfo.toLoginInfo();
					request.getSession(true).setAttribute("loginInfo",loginInfo);
					if(userInfo.getU_name() == "admin") {
						loginChk = 4;
					} else {
						loginChk = 2;
					}
					dateService.saveDate(userInfo.getU_idx());
				} else {
					loginChk = 1;
					request.getSession(true).setAttribute("email",userInfo.getU_id());
				}
			} 
			
		} else {
			loginChk = 0;
		}
		

		return loginChk;
	}
}
