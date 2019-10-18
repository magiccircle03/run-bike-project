package com.teamrun.runbike.record.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.teamrun.runbike.record.domain.RegRecord;
import com.teamrun.runbike.record.domain.RentBikeStatus;
import com.teamrun.runbike.record.domain.RESULT;
import com.teamrun.runbike.record.domain.Row;
import com.teamrun.runbike.record.domain.SeoulBikeList;
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
	
	@RequestMapping("/seoulBikeFirst")
	@CrossOrigin
	public ResponseEntity<List<Row>> seoulBikeFirst() {
		
		RestTemplate restTemplate = new RestTemplate();	
		
		SeoulBikeList seoulBikeList = restTemplate.getForObject("http://openapi.seoul.go.kr:8088/574c4c6e5173757038395565797a4f/json/bikeList/1/1000", SeoulBikeList.class);
		RentBikeStatus rentBikeStatus = seoulBikeList.getRentBikeStatus();
		int list_total_count = rentBikeStatus.getList_total_count();
		List<Row> row = rentBikeStatus.getRow();
		 
		 System.out.println("첫번째 따릉이 수 : " + list_total_count);
		  
		return new ResponseEntity<List<Row>>(row, HttpStatus.OK);
	}
	
	
	  @RequestMapping("/seoulBikeSecond")	  
	  @CrossOrigin 
	  public ResponseEntity<List<Row>> seoulBikeSecond() {
	  
	  RestTemplate restTemplate = new RestTemplate();
	  
	  SeoulBikeList seoulBikeList = restTemplate.getForObject("http://openapi.seoul.go.kr:8088/574c4c6e5173757038395565797a4f/json/bikeList/1001/2000", SeoulBikeList.class);
	  RentBikeStatus rentBikeStatus = seoulBikeList.getRentBikeStatus();
	  int list_total_count = rentBikeStatus.getList_total_count();
	  List<Row> row = rentBikeStatus.getRow();
		 
	  System.out.println("두번째 따릉이 수 : " + list_total_count);
	  
	  return new ResponseEntity<List<Row>>(row, HttpStatus.OK);
	}
	 
	
	@RequestMapping(method = RequestMethod.POST)
	@CrossOrigin
	public ResponseEntity<String> insertRecord(RegRecord regRecord, HttpServletRequest reqeust) {
		
		System.out.println("check : " + regRecord);
		
		int cnt = insertService.insertRecord(regRecord, reqeust);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
	
}
