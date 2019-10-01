package com.teamrun.runbike.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.qna.domain.RequestMemberWrite;
import com.teamrun.runbike.qna.service.BoardWriteService;

@CrossOrigin
@Controller
@RequestMapping("/board/writeform")
public class BoardWriteController {

	
	@Autowired
	private BoardWriteService writeboardService;

	@RequestMapping(method=RequestMethod.GET)
	public String getForm(){
	return "qnaboard/writeboard";
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String writeboard(RequestMemberWrite regRequest, HttpServletRequest request) {
	
			System.out.println("문의글 작성 컨트롤러:"+regRequest);
	
			int cnt = writeboardService.write(request, regRequest);
	
			return cnt > 0 ? "SUCCESS" : "FAIL";
	
		}
		
	}
