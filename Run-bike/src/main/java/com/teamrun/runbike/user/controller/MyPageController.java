package com.teamrun.runbike.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/mypage")
public class MyPageController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String mypage() {
		return "user/mypage";
	}
}
