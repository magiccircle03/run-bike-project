package com.teamrun.runbike.mycourse.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamrun.runbike.mycourse.dao.MyCourseDao;

@Service("getTotalPageService")
public class GetTotalPageService {

	@Autowired
	private SqlSessionTemplate template;
	
	private MyCourseDao dao;
	
	private final int CNT_LIST = 4;
	
	public int getTotalPage(int u_idx) {
		
		dao = template.getMapper(MyCourseDao.class);
		
		//전체 컨텐츠 수 불러와서 전체 컨텐츠 수 변수에 담기
		int totalCount = dao.getTotalCount(u_idx);
		
		//전체 페이지 수 변수
		int pageTotalCount = 0;
	
		if(totalCount > 0) {
			pageTotalCount = totalCount/CNT_LIST;
			
			if(totalCount % CNT_LIST > 0) {
				pageTotalCount ++;
			}
		}		
		return pageTotalCount; 
	}
}
