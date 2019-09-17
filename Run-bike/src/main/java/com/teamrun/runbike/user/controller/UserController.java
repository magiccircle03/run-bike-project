package com.teamrun.runbike.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamrun.runbike.user.domain.RegisterInfo;
import com.teamrun.runbike.user.service.UpdateService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UpdateService updateService;
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public int update(MultipartHttpServletRequest request, RegisterInfo regInfo) {
		int result = 0;
		
		result = updateService.updateInfo(request, regInfo);
		
		return result;
	}
}
