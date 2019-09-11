package com.teamrun.runbike.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.user.service.LoginService;

@Controller
@RequestMapping("user/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getForm(HttpServletRequest request) {
		return "user/loginform";
	}
	
	@RequestMapping(method= RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam("u_id")String u_id, @RequestParam("u_pw")String u_pw, HttpServletRequest request) {
		String result = "";
		System.out.println("u_id : "+u_id);
		System.out.println("u_pw : "+u_pw);
		int loginChk = loginService.login(u_id, u_pw, request);
		
		switch(loginChk) {
		case 2: 
			result = "ok";
			break;
		case 1:
			result = "yet";
			break;
		case 0:
			result = "no";
				
		}
		System.out.println("컨트롤러 세션 : "+request.getSession(false).getAttribute("loginInfo"));
		
		return result;
	}
	
	
}
