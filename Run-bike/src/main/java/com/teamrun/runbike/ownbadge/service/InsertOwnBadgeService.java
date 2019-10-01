package com.teamrun.runbike.ownbadge.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.ownbadge.dao.OwnBadgeDao;
import com.teamrun.runbike.user.domain.LoginInfo;

@Service("insertOwnBadgeService")
public class InsertOwnBadgeService {

	@Autowired
	private SqlSessionTemplate template;
	
	private OwnBadgeDao dao;
	
	// 첫 로그인 조건에 따른 뱃지 insert
	public void insertFirstLoginBadge(HttpServletRequest request) {
		
		dao = template.getMapper(OwnBadgeDao.class);
		
		LoginInfo loginInfo = (LoginInfo)request.getSession().getAttribute("loginInfo");
		
		int u_idx = loginInfo.getU_idx();
		
		
		if(dao.firstLogin(u_idx)>=1) {
			if(dao.isMyBadge(u_idx, 1)==0) {
				System.out.println("출력이 된다된다된다된다!!");
				dao.insertMyBadge(1, u_idx);
			}
		};
		
	}
	
	// 연속 로그인
	 public void insertConsecutiveLoginBadge(HttpServletRequest request) { dao =
	 template.getMapper(OwnBadgeDao.class);
	 
	 LoginInfo loginInfo =
	 (LoginInfo)request.getSession().getAttribute("loginInfo");
	 
	 int u_idx = loginInfo.getU_idx();
	 
	 if(dao.consecutiveLogin(u_idx)>=1) {
		 if(dao.isMyBadge(u_idx, 2)==0) { dao.insertMyBadge(2, u_idx); } }
	 
	 }
	 
	
	// 혼자 라이딩 km
	public void insertRidingAloneKmBadge(HttpServletRequest request) {
		dao = template.getMapper(OwnBadgeDao.class);
			
		LoginInfo loginInfo = (LoginInfo)request.getSession().getAttribute("loginInfo");
			
		int u_idx = loginInfo.getU_idx();
			
		if(dao.ridingAloneDistance(u_idx)>=10) {
			if(dao.isMyBadge(u_idx, 3)==0) {
				dao.insertMyBadge(3, u_idx);
			}
		};
		
	}
	
	// 같이 달리기 10키로
	public void insertRidingWithKmBadge(HttpServletRequest request) {
		dao = template.getMapper(OwnBadgeDao.class);
			
		LoginInfo loginInfo = (LoginInfo)request.getSession().getAttribute("loginInfo");
			
		int u_idx = loginInfo.getU_idx();
			
			
		if(dao.ridingWithDistance(u_idx)>=10) {
			if(dao.isMyBadge(u_idx, 4)==0) {
				dao.insertMyBadge(4, u_idx);
			}
		};
		
	}
	
	// 혼자 달리기 1시간
	public void insertRidingAloneTimeBadge(HttpServletRequest request) {
		dao = template.getMapper(OwnBadgeDao.class);
			
		LoginInfo loginInfo = (LoginInfo)request.getSession().getAttribute("loginInfo");
			
		int u_idx = loginInfo.getU_idx();
			
			
		if(dao.ridingAloneTime(u_idx)>=1) {
			if(dao.isMyBadge(u_idx, 5)==0) {
				dao.insertMyBadge(5, u_idx);
			}
		};
		
	}
	
	// 스탬프 5개 이상
	public void insertOwnStampBadge(HttpServletRequest request) {
		dao = template.getMapper(OwnBadgeDao.class);
			
		LoginInfo loginInfo = (LoginInfo)request.getSession().getAttribute("loginInfo");
			
		int u_idx = loginInfo.getU_idx();
			
			
		if(dao.myOwnStampCount(u_idx)>=5) {
			if(dao.isMyBadge(u_idx, 6)==0) {
				dao.insertMyBadge(6, u_idx);
			}
		};
		
	}	

	// 방장 1번 이상 여부
	public void insertIsMasterBadge(HttpServletRequest request) {
		dao = template.getMapper(OwnBadgeDao.class);
			
		LoginInfo loginInfo = (LoginInfo)request.getSession().getAttribute("loginInfo");
			
		int u_idx = loginInfo.getU_idx();
			
			
		if(dao.isMasterCount(u_idx)>=1) {
			if(dao.isMyBadge(u_idx, 7)==0) {
				dao.insertMyBadge(7, u_idx);
			}
		};
		
	}
}
