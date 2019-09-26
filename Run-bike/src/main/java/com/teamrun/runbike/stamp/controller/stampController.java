package com.teamrun.runbike.stamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/stamp")
public class stampController {
	
	//관리자 스탬프 페이지 
	@RequestMapping("/admin")
	public String getStampAdminpage() {
		String view = "adminpage/adminStamp";
		return view;
	}
	
	
	//사용자 스탬프 조회 페이지
	@RequestMapping("/user")
	public String getUsersStamp() {
		String view = "rewards/myStamp";
		return view;	
	 }
	
	//스탬프 얻기 위한 페이지
	@RequestMapping("/getStamp")
	public String getStampGame() {
		String view = "stamp/getStamp";
		return view;
	}
	
}
