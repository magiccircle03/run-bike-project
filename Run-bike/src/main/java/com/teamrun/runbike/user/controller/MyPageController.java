package com.teamrun.runbike.user.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.user.service.UserRecordService;

@Controller
@RequestMapping("/user")
public class MyPageController {
	
	@Autowired
	private UserRecordService recordService;
	
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String mypage() {
		return "user/mypage";
	}
	
	@RequestMapping(value="/record/{u_idx}")
	@ResponseBody
	public Map<String, Object> viewRecord (@PathVariable("u_idx")int u_idx){
		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap = recordService.getRecord(u_idx);
		
		System.out.println(listMap);
		return listMap;
		
	}
}
