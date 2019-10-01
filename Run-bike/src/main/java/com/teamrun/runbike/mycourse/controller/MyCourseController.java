package com.teamrun.runbike.mycourse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.mycourse.domain.MyCourse;
import com.teamrun.runbike.mycourse.domain.RegMyCourse;
import com.teamrun.runbike.mycourse.service.ChangeMyCourseService;
import com.teamrun.runbike.mycourse.service.DeleteMyCourseService;
import com.teamrun.runbike.mycourse.service.GetMyCourseListService;
import com.teamrun.runbike.mycourse.service.GetMyCourseService;
import com.teamrun.runbike.mycourse.service.GetTotalPageService;
import com.teamrun.runbike.mycourse.service.InsertMyCourseService;

@Controller
@RequestMapping("/myCourse")
public class MyCourseController {

	@Autowired
	private InsertMyCourseService insertService;
	
	@Autowired
	private GetTotalPageService totalPageService;
	
	@Autowired
	private GetMyCourseListService listService;
	
	@Autowired
	private ChangeMyCourseService changeService;

	@Autowired
	private DeleteMyCourseService deleteService;
	
	// Create
	@RequestMapping(method = RequestMethod.POST)
	@CrossOrigin
	public ResponseEntity<String> insertMyCourse(RegMyCourse regMyCourse, HttpServletRequest request) {

		System.out.println("check : " + regMyCourse);

		int cnt = insertService.insertMyCourse(regMyCourse, request);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}

	
	  // Read 
	  @CrossOrigin
	  @ResponseBody
	  @RequestMapping(value = "/{currentPageNumber}", method = RequestMethod.GET) public
	  ResponseEntity<List<MyCourse>> selectMyCourseList(@PathVariable("currentPageNumber") int currentPageNumber, HttpServletRequest request) {
	  
	  List<MyCourse> myCourseList = listService.getListData(currentPageNumber, request);
	  
	  ResponseEntity<List<MyCourse>> entity = new
	  ResponseEntity<List<MyCourse>>(myCourseList, HttpStatus.OK);
	  
	  return entity;
	  }

	//전체 페이지 수 가져오기  
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/totalPage/{u_idx}", method = RequestMethod.GET)
	public ResponseEntity<Integer> getTotalPage(@PathVariable("u_idx") int u_idx){
		
		int totalPage = totalPageService.getTotalPage(u_idx);
		
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(totalPage, HttpStatus.OK);
		
		return entity;	
	}
	
	// Update
	@CrossOrigin
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<String> changeMyCourse(@RequestBody MyCourse myCourse) {
		
		int cnt = changeService.changeMyCourse(myCourse);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}

	// Delete
	@CrossOrigin
	@RequestMapping(value = "/{mc_idx}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteMyCourse(@PathVariable("mc_idx") int mc_idx) {
		
		int cnt = deleteService.deleteService(mc_idx);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
}
