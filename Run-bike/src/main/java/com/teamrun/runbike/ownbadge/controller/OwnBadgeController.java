package com.teamrun.runbike.ownbadge.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamrun.runbike.ownbadge.domain.MyBadge;
import com.teamrun.runbike.ownbadge.service.GetOwnBadgeService;
import com.teamrun.runbike.ownbadge.service.InsertOwnBadgeService;

@Controller
@RequestMapping("/badge")
public class OwnBadgeController {

	@Autowired
	private GetOwnBadgeService getService;
	
	@Autowired
	private InsertOwnBadgeService insertService;
	
	// 사용자 뱃지 페이지
	@RequestMapping("/user")
	public String getUsersBadge(Model model, HttpServletRequest request) {
		
		String view = "rewards/myBadge";
		insertService.insertFirstLoginBadge(request);
		insertService.insertConsecutiveLoginBadge(request);
		insertService.insertRidingAloneKmBadge(request);
		insertService.insertRidingWithKmBadge(request);
		insertService.insertRidingAloneTimeBadge(request);
		insertService.insertOwnStampBadge(request);
		insertService.insertIsMasterBadge(request);
		
		List<MyBadge> myBadgeList = getService.selectMyBadge(request);
		
		model.addAttribute("myBadgeList",myBadgeList);
		
		System.out.println(myBadgeList);
		
		
		return view;
	}

}
