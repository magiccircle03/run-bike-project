package com.teamrun.runbike.record.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.record.dao.RecordDao;
import com.teamrun.runbike.record.domain.Record;
import com.teamrun.runbike.record.domain.RegRecord;

@Service("insertRecordService")
public class InsertRecordService {

	@Autowired
	private SqlSessionTemplate template;
	
	private RecordDao dao;
	
	public int insertRecord(RegRecord regRecord, HttpServletRequest request) {
		
		dao = template.getMapper(RecordDao.class);
		
		Record record = regRecord.toRecord();
		
		record.setU_idx(71);
		
		int rCnt = dao.insertRecord(record);
		
		return rCnt;
	}
}
