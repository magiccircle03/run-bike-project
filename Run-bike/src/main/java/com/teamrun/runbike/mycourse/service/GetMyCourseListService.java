package com.teamrun.runbike.mycourse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.mycourse.dao.MyCourseDao;
import com.teamrun.runbike.mycourse.domain.MyCourse;
import com.teamrun.runbike.user.domain.LoginInfo;

@Service("getMyCourseListService")
public class GetMyCourseListService {

	@Autowired
	private SqlSessionTemplate template;
	
	private MyCourseDao dao;

	final int CNT_LIST = 4;
	
	public List<MyCourse> getListData(int currentPageNumber, HttpServletRequest request){
		
		dao = template.getMapper(MyCourseDao.class);
		
		int index = (currentPageNumber - 1) * CNT_LIST;
		
		// 쿼리문  parameterType → map이므로 map에 쿼리문에 필요한 변수들 모두 넣어서 보내주기
		// index 부터 CNT_LIST개
		// select * from my_course where u_idx=#{u_idx} limit #{index}, #{CNT_LIST}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("index", index);
		params.put("CNT_LIST", CNT_LIST);
		//★추후에 Server쪽 Session으로 받아오기
		//세션에서 로그인 정보 받아오기
		LoginInfo loginInfo = (LoginInfo)request.getSession(false).getAttribute("loginInfo");
		int u_idx = loginInfo.getU_idx();
		params.put("u_idx", u_idx);
		
		//map형태로 보낸 parameters를 통해 MyCourse 반환받고 저장
		List<MyCourse> myCourseList = null;
		myCourseList = dao.selectMyCourseByPage(params);		
		
		//잘 받아왔는지 확인하기
		for(MyCourse m : myCourseList) {
			System.out.println(m);
		}
		
		return myCourseList;
	}

}
