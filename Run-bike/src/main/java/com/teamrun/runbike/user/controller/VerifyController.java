package com.teamrun.runbike.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamrun.runbike.user.service.VerifyService;

@Controller
@RequestMapping("mail/verify")
public class VerifyController {
	@Autowired
	private VerifyService verifyService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String verify(@RequestParam("id")String u_id, @RequestParam("code")String u_code) {
		String result = verifyService.verify(u_id, u_code);
//		String result = "no";
		System.out.println(result);
		System.out.println("user/verify"+result);
		return "user/verify"+result;
	}
}
