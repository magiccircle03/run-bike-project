package com.teamrun.runbike.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.user.domain.RegisterInfo;
import com.teamrun.runbike.user.service.LoginService;
import com.teamrun.runbike.user.service.RegisterService;

@Controller
@RequestMapping("user")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	
	@RequestMapping(value=("login"), method = RequestMethod.GET)
	public String getForm(HttpServletRequest request) {
		return "user/loginform";
	}
	
	@RequestMapping(value=("login"), method= RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam("u_id")String u_id, @RequestParam("u_pw")String u_pw, HttpServletRequest request) {
		String result = "";
		System.out.println("u_id : "+u_id);
		System.out.println("u_pw : "+u_pw);
		int loginChk = 0;
		
		
		
		loginChk = loginService.login(u_id, u_pw, request);
		
		switch(loginChk) {
		case 4:
			result = "admin";
			break;
		case 3:
			result = "leave";
			break;
		case 2: 
			result = "ok";
			break;
		case 1:
			result = "yet";
			break;
		case 0:
			result = "no";
			break;
		}
		
		System.out.println("loginResult : "+result);
		return result;
	}
	
	@RequestMapping(value=("login/naver"), method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String loginWithNaver(RegisterInfo regInfo, HttpServletRequest request, String photo) {
		System.out.println(regInfo);
		String result = loginService.loginWithNaver(regInfo, request);
		
		return result; 
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
}
