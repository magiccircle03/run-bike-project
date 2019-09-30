package com.teamrun.runbike.ownbadge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/badge")
public class OwnBadgeController {

	// 사용자 뱃지 페이지
	@RequestMapping("/user")
	public String getUsersBadge() {
		String view = "rewards/myBadge";
		return view;
	}
}
