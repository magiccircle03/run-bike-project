package com.teamrun.runbike.ownstamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamrun.runbike.ownstamp.domain.Stamp;
import com.teamrun.runbike.ownstamp.service.OwnStampService;

@Controller
@RequestMapping("/stamp")
public class OwnStampController {

	@Autowired
	private OwnStampService service;
	
	// 사용자 스탬프 조회 페이지
	@RequestMapping("/user")
	public String selectAllStamp(Model model, HttpServletRequest request) {
		
		String view = "rewards/myStamp";

		List<Stamp> stampList = service.getAllStamp();
		List<Stamp> myStampList = service.selectMyStamp(request);
		
		model.addAttribute("stampList", stampList);
		model.addAttribute("myStampList", myStampList);
		
		System.out.println(stampList);
		System.out.println(myStampList);
		
		return view;
	}

	// 스탬프 얻기 위한 페이지
	@RequestMapping("/getStamp")
	public String getStampGame(Model model) {
		
		String view = "stamp/getStamp";

		List<Stamp> stampList = service.getAllStamp();
		
		model.addAttribute("stampList", stampList);
		
		return view;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public List<Stamp> getMyStamp(HttpServletRequest request){
		
		List<Stamp> myStampList = service.selectMyStamp(request);
		
		return myStampList;
	}

}
