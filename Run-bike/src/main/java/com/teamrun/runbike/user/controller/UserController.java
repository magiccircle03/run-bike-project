package com.teamrun.runbike.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamrun.runbike.user.domain.RegisterInfo;
import com.teamrun.runbike.user.domain.RequestEditInfo;
import com.teamrun.runbike.user.service.UpdateService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UpdateService updateService;
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String updateForm() {
		return "mypage";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public int update(MultipartHttpServletRequest request, RequestEditInfo editInfo) {
		int result = 0;
		
		
		
		result = updateService.updateInfo(request,editInfo.getOldFile(), editInfo);
		
		return result;
	}
}
