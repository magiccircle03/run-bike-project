package com.teamrun.runbike.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamrun.runbike.qna.domain.Message;
import com.teamrun.runbike.qna.service.BoardDetailService;

@Controller
@RequestMapping("/boarddetail")
public class DetailController {
	
	@Autowired
	private BoardDetailService testdetailService;
	
	
	
	@RequestMapping(method=RequestMethod.GET)
	public String gettestdetail() {
		return "qnaboard/detailBoard";
	}
	
	
	@RequestMapping(value="/{q_num}", method = RequestMethod.GET)
	public String boardDetail(Model model, @PathVariable("q_num") int q_num) {
		//public Message testDetail(int q_num) {
		
		Message detailtestInfo = testdetailService.getDetaildata(q_num);
		System.out.println(detailtestInfo);
		
		model.addAttribute("detailData", detailtestInfo);
		
		return "qnaboard/detailBoard";
		
	}

}
