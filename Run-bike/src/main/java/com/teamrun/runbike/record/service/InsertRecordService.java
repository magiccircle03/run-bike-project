package com.teamrun.runbike.record.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.record.dao.RecordDao;
import com.teamrun.runbike.record.domain.Record;
import com.teamrun.runbike.record.domain.RegRecord;
import com.teamrun.runbike.user.domain.LoginInfo;

@Service("insertRecordService")
public class InsertRecordService {

	@Autowired
	private SqlSessionTemplate template;

	private RecordDao dao;

	public int insertRecord(RegRecord regRecord, HttpServletRequest request) {

		dao = template.getMapper(RecordDao.class);

		Record record = regRecord.toRecord();

		// 세션에서 로그인 정보 받아오기
		LoginInfo loginInfo = (LoginInfo) request.getSession(false).getAttribute("loginInfo");

		int u_idx = loginInfo.getU_idx();

		record.setU_idx(u_idx);

		int rCnt = dao.insertRecord(record);

		return rCnt;
	}
}
