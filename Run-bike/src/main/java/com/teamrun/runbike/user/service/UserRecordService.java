package com.teamrun.runbike.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.user.dao.UserDao;

@Service("recordService")
public class UserRecordService {
	@Autowired
	private SqlSessionTemplate template;
	
	private UserDao dao;
	
	public Map<String, Object> getRecord(int u_idx){
		dao = template.getMapper(UserDao.class);
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> listMap = new HashMap<String, Object>();
		List<Map<String, Object>> recentList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> partyList = new ArrayList<Map<String, Object>>();
		
		
		
		map = dao.getRecord(u_idx);
		recentList = dao.getRecentRecord(u_idx);
		partyList = dao.getpartyRecord(u_idx);
		
		listMap.put("userRecord", map);
		listMap.put("recentRecord", recentList);
		listMap.put("partyRecord", partyList);
		
		System.out.println("service : "+recentList);
		System.out.println("service : "+partyList);
		return listMap;
	}
}
