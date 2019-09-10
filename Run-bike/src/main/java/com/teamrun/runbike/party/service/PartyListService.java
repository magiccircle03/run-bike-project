package com.teamrun.runbike.party.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.party.dao.PartyDaoInterface;
import com.teamrun.runbike.party.domain.PartyInfo;

@Service
public class PartyListService {
	
	private PartyDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	public List<PartyInfo> getAllList() {
		dao = template.getMapper(PartyDaoInterface.class);
		List<PartyInfo> list = dao.selectAllPartyList();
		return list;
	}
}
