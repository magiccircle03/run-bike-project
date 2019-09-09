package com.teamrun.runbike.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/register")
public class RegisterController {
	
	@Autowired
	private RegisterService regService; 
	
	@RequestMapping(method=RequestMethod.GET)
	public String getForm() {
		return "user/registerform";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String regist(HttpServletRequest request, @RequestBody RequestRegisterInfo regInfo) {
		int result = regService.register(request, regInfo);
		
		return "user/regist";
	}
}
