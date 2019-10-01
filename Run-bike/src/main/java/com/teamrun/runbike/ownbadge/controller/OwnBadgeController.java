package com.teamrun.runbike.ownbadge.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamrun.runbike.ownbadge.domain.Badge;
import com.teamrun.runbike.ownbadge.service.OwnBadgeService;

@Controller
@RequestMapping("/badge")
public class OwnBadgeController {

	@Autowired
	private OwnBadgeService service;
	
	// 사용자 뱃지 페이지
	@RequestMapping("/user")
	public String getUsersBadge(Model model, HttpServletRequest request) {
		String view = "rewards/myBadge";
		
		List<Badge> badgeList = service.getAllBadge();
		List<List<Badge>> myBadgeList = service.getMyBadge(request);
		
		System.out.println(myBadgeList.size());
		
		model.addAttribute("badgeList", badgeList);
		model.addAttribute("myBadgeList",myBadgeList);
		
		System.out.println("마뱃지"+myBadgeList);
		System.out.println(badgeList);
		
		service.insertFirstLoginBadge(request);
		
		//service.insertConsecutiveLoginBadge(request);
		service.insertRidingAloneKmBadge(request);
		service.insertRidingWithKmBadge(request);
		service.insertRidingAloneTimeBadge(request);
		service.insertOwnStampBadge(request);
		service.insertIsMasterBadge(request);
		return view;
	}

}
