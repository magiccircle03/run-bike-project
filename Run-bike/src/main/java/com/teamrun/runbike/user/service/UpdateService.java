package com.teamrun.runbike.user.service;

import java.io.File;
import java.io.IOException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamrun.runbike.user.dao.UserDao;
import com.teamrun.runbike.user.domain.LoginInfo;
import com.teamrun.runbike.user.domain.RegisterInfo;
import com.teamrun.runbike.user.domain.UserInfo;

@Service("updateService")
public class UpdateService implements UserService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private UserDao dao; 
	
	public int updateInfo(MultipartHttpServletRequest request, RegisterInfo regInfo) {
		
		dao = template.getMapper(UserDao.class);
		int result = 0;
		
		
		
		
		LoginInfo loginInfo = (LoginInfo)request.getSession(false).getAttribute("loginInfo");
		
		regInfo.setU_id(loginInfo.getU_id());
		
		UserInfo userInfo = regInfo.toUserInfo();
		
		dao.updateUser();
		
		return result;
	}
}
