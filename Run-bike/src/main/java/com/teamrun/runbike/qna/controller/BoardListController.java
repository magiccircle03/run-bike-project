package com.teamrun.runbike.qna.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.qna.domain.ListViewBoardData;
import com.teamrun.runbike.qna.domain.Message;
import com.teamrun.runbike.qna.domain.SearchParam;
import com.teamrun.runbike.qna.service.BoardListService;

@Controller
@RequestMapping("/qnaboard")
public class BoardListController {


	@Autowired
	private BoardListService boardlistService;
		
		@RequestMapping(method=RequestMethod.GET)
		public String boardlist() {
			return "qnaboard/list";
		}
		
		@RequestMapping(value="/list", method = RequestMethod.GET)
		@ResponseBody
		public List<Message> getAllList(){
			
			List<Message> list = boardlistService.getAllList();
			
			System.out.println(list);
			return list;
			
		}

		
		@RequestMapping("/list")
		public String pageList(Model model,@RequestParam(value = "p", defaultValue = "1") int pageNumber,
											@RequestParam(value = "stype", required = false) String stype,
											@RequestParam(value = "keyword", required = false) String keyword
				) {
						
			SearchParam searchParam = null; 
			
			if(	stype!=null && keyword!=null && !stype.isEmpty() && !keyword.isEmpty()) {
				searchParam = new SearchParam();
				searchParam.setStype(stype);
				searchParam.setKeyword(keyword);
			}
			
			ListViewBoardData pagelistdata = boardlistService.getListData(pageNumber,searchParam);
			
			model.addAttribute("pageviewData", pagelistdata);
			
			return "qnaboard/list";
			
		}
		

		
		
		
		
		
		
		
		
		
		
		
	}
	


