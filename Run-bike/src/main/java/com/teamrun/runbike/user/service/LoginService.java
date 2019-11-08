package com.teamrun.runbike.user.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.user.dao.UserDao;
import com.teamrun.runbike.user.domain.LoginInfo;
import com.teamrun.runbike.user.domain.RegisterInfo;
import com.teamrun.runbike.user.domain.UserInfo;

@Service("loginService")
public class LoginService implements UserService {
	@Autowired
	private SqlSessionTemplate template;
	@Autowired
	private SaveDateService dateService;
	
	private UserDao dao;
	
	public int login(String u_id, String u_pw,HttpServletRequest request) {
		// 관리 = 4
		// 탈퇴 = 3
		// 이메일 인증 = 2
		// 이메일 미인증 = 1
		// 로그인 실패 = 0
		
		int loginChk = 0;
		UserInfo userInfo = null;
		boolean isLeave = false;
		dao = template.getMapper(UserDao.class);
		
		
		
		userInfo = dao.selectUserById(u_id);
		System.out.println(userInfo.getU_id());
		System.out.println(userInfo.getU_name());
		System.out.println("userInfo : "+userInfo);
		if(userInfo !=null && userInfo.checkPW(u_pw)) {
			isLeave = dao.selectLeaveById(u_id);	
			if(isLeave) {
				loginChk=3;
			} else {
				if(userInfo.isU_verify()) {
					if(userInfo.getU_id().equals("admin") || userInfo.getU_name().equals("관리자")) {
						System.out.println("관리자 로그인???");
						loginChk = 4;
					} else {
						System.out.println("일반로그인?????");
						loginChk = 2;
					}
					LoginInfo loginInfo = userInfo.toLoginInfo();
					request.getSession(true).setAttribute("loginInfo",loginInfo);
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
	
	public String loginWithNaver(RegisterInfo regInfo, HttpServletRequest request, String image) {
		UserInfo userInfo = null;
		if(image == null) {
			image = "noImg.jpg";
		}
		
		
		dao = template.getMapper(UserDao.class);
		
		userInfo = regInfo.toUserInfo();
		userInfo.setU_photo(image);
		int result = dao.insertUser(userInfo);
		int sns = dao.updateIsSns(userInfo.getU_idx());
		System.out.println(userInfo.toString());
		
		
		System.out.println(sns);
		
		dao.chkVerify(userInfo.getU_id(), userInfo.getU_code());
		dateService.saveDate(userInfo.getU_idx());
		
		LoginInfo loginInfo = userInfo.toLoginInfo();
		
		request.getSession(false).setAttribute("loginInfo", loginInfo);
		
		return result >0 ? "Y":"N";
	}
}
