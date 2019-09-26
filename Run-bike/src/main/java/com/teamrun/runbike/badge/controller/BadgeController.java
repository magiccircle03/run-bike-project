package com.teamrun.runbike.badge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/badge")
public class BadgeController {
	
	//관리자 뱃지 페이지
	@RequestMapping("/admin")
	public String getBadgeAdminpage() {
		String view = "adminpage/adminBadge";
		return view;
	}
	
	
	//사용자 뱃지 페이지 
	@RequestMapping("/user")
	public String getUsersBadge() {
		String view = "rewards/myBadge";
		return view;	
	 }
	 

}
