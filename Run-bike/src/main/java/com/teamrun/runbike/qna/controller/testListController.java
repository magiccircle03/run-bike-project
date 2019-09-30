package com.teamrun.runbike.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.teamrun.runbike.qna.domain.ListViewBoardData;
import com.teamrun.runbike.qna.domain.SearchParam;
import com.teamrun.runbike.qna.service.BoardListService;

@CrossOrigin
@RestController
@RequestMapping("/qnaboard/testlist")
public class testListController {

		@Autowired
		private BoardListService restListSerivce;
	
		public ResponseEntity<ListViewBoardData> restboardList(@RequestParam(value = "page", defaultValue = "1") int page,
				@RequestParam(value = "searchType", required = false) String sType,
				@RequestParam(value="keyword", required = false) String keyword){
			

			SearchParam searchParam = null;
			
			if(sType!=null && keyword!=null && !sType.isEmpty() && !keyword.isEmpty() ) {
				searchParam = new SearchParam();
				searchParam.setStype(sType);
				searchParam.setKeyword(keyword);
				System.out.println("컨트롤러 : "+searchParam);
			}
			
			ListViewBoardData listData = restListSerivce.getListData(page,searchParam);
			
			ResponseEntity<ListViewBoardData> entity = new ResponseEntity<ListViewBoardData>(listData,HttpStatus.OK);
			
			return entity;
		}
		

	}

