package com.teamrun.runbike.ownstamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.ownstamp.domain.Stamp;
import com.teamrun.runbike.ownstamp.service.InsertOwnStampService;
import com.teamrun.runbike.ownstamp.service.GetOwnStampService;

@Controller
@RequestMapping("/stamp")
public class OwnStampController {

	@Autowired
	private GetOwnStampService getService;

	@Autowired
	private InsertOwnStampService insertService;

	// 사용자 스탬프 조회 페이지
	@RequestMapping("/user")
	public String selectAllStamp(Model model, HttpServletRequest request) {

		String view = "rewards/myStamp";

		List<Stamp> stampList = getService.getAllStamp();
		List<Stamp> myStampList = getService.selectMyStamp(request);
		
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

		List<Stamp> stampList = getService.getAllStamp();

		model.addAttribute("stampList", stampList);

		return view;
	}

	//스탬프 insert
	@RequestMapping(method = RequestMethod.POST)
	@CrossOrigin
	public ResponseEntity<String> insertStamp(@RequestParam int s_num, HttpServletRequest request) {

		System.out.println("s_num:" +s_num);
		int cnt = insertService.insertOwnStamp(s_num, request);
		
		System.out.println(":::::::::::::::::::::::::입력 값은 " + cnt);
		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	@CrossOrigin
	@ResponseBody
	public List<Stamp> getMyStamp(HttpServletRequest request){
		
		List<Stamp> myStampList = getService.selectMyStamp(request);
		
		return myStampList;
	}

}
