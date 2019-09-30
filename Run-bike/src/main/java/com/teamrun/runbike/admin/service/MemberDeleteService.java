package com.teamrun.runbike.admin.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.admin.dao.AdminDao;



@Service("MemberDeleteService")
public class MemberDeleteService {

	
	
	
	private AdminDao dao;

	@Inject
	private SqlSessionTemplate template;
	

	public int memberDeleteAdmin(int u_idx) {
		

		dao = template.getMapper(AdminDao.class);
		
		return dao.memberDeleteAdmin(u_idx);
	}

	
	
	
	
}
