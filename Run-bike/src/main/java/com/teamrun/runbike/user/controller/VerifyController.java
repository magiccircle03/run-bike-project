package com.teamrun.runbike.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.user.service.MailSenderService;
import com.teamrun.runbike.user.service.VerifyService;

@Controller
@RequestMapping("verify")
public class VerifyController {
	@Autowired
	private VerifyService verifyService;
	
	@Autowired
	private MailSenderService mailService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String verify(@RequestParam("id")String u_id, @RequestParam("code")String u_code) {
		String result = verifyService.verify(u_id, u_code);
//		String result = "no";
		return "user/verify"+result;
	}
	
	@RequestMapping("yet")
	public String verifyYet() {
		return "user/verifyyet";
	}
	
	@RequestMapping("resend")
	@ResponseBody
	public void resend(@RequestParam("email")String u_id) {
		mailService.mailResend(u_id);
	}
}
