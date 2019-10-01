package com.teamrun.runbike.user.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.user.dao.UserDao;
import com.teamrun.runbike.user.domain.LoginLogInfo;

@Service("dateService")
public class SaveDateService implements UserService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private UserDao dao;
	
	public void saveDate(int u_idx) {
		System.out.println("u_idx : "+u_idx);
		dao = template.getMapper(UserDao.class);
		Map<String, Object> param = new HashMap<String, Object>();
		
		Date today = new Date();
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		
		param.put("u_idx", u_idx);
		param.put("date", sm.format(today));
		
		System.out.println(param.get("u_idx"));
		System.out.println(param.get("date"));
		System.out.println(param);
		
		int count = dao.chkLoginLog(param);
		
		System.out.println("date chk :"+ count);
		
		if(count == 0) {
			dao.insertLoginDate(u_idx);
		}
		
	}
}
