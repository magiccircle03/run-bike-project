package com.teamrun.runbike.record.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamrun.runbike.record.domain.RegRecord;
import com.teamrun.runbike.record.service.InsertRecordService;

@Controller
@RequestMapping("/record")
public class RecordController {

	@Autowired
	private InsertRecordService insertService;
	
	@RequestMapping("/ridingGuide")
	public String getRidingGuide() {
		String view = "/guide/ridingGuide";
		return view;
	}
	
	@RequestMapping("/startRide")
	public String getStartRide() {
		String view = "/record/startRide";
		return view;
	}
	
	@RequestMapping("/regMyCourse")
	public String getRegMyCourse() {
		String view = "/myCourse/regMyCourse";
		return view;
	}
	
	@RequestMapping("/myCourseList")
	public String getMyCourseList() {
		String view = "/myCourse/myCourseList";
		return view;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	@CrossOrigin
	public ResponseEntity<String> insertRecord(RegRecord regRecord, HttpServletRequest reqeust) {
		
		System.out.println("check : " + regRecord);
		
		int cnt = insertService.insertRecord(regRecord, reqeust);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
}
