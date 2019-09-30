package com.teamrun.runbike.qna.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.qna.domain.BoardListView;
import com.teamrun.runbike.qna.service.GetBoardListService;

@Controller   
public class BoardPageController {

	@Autowired
	private GetBoardListService getlistService;

	@RequestMapping("/board/listJson")
	@ResponseBody
	public BoardListView getListJson(@RequestParam(value = "page",defaultValue = "1") int pageNumber,Model model,HttpServletResponse response) {
		
		BoardListView listView = getlistService.getBoardListView(pageNumber);
	
		return listView;
	}
}
