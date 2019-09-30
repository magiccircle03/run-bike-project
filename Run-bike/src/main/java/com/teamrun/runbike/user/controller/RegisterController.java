package com.teamrun.runbike.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamrun.runbike.user.domain.RegisterInfo;
import com.teamrun.runbike.user.service.RegisterService;

@CrossOrigin
@Controller
@RequestMapping("/user/register")
public class RegisterController {
	
	@Autowired
	private RegisterService regService; 
	
	@RequestMapping(method=RequestMethod.GET)
	public String getForm() {
		return "user/registerform";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String regist(MultipartHttpServletRequest request, RegisterInfo regInfo) {
		System.out.println(regInfo);
		int result = regService.regService(request, regInfo);
		
		
		return result > 0 ? "ok" : "no";
	}
	
	@RequestMapping("idCheck")
	@ResponseBody
	public String idCheck(@RequestParam(value="u_id") String u_id) {
		System.out.println(u_id);
		String result = regService.idCheck(u_id);
		System.out.println("result : "+result);
		return result;
	}
}
