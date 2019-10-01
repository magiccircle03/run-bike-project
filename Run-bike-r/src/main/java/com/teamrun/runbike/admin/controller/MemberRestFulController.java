package com.teamrun.runbike.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teamrun.runbike.admin.service.MemberDeleteService;
import com.teamrun.runbike.admin.service.MemberListService;
import com.teamrun.runbike.user.domain.UserInfo;




@RestController
@RequestMapping("/rest/admin")
public class MemberRestFulController {

	
	 @Autowired 
	  private MemberListService listService;
	 
	  @Autowired 
	  private MemberDeleteService deleteService;
	 
	 

	  @CrossOrigin
	  @GetMapping 
	  public ResponseEntity<List<UserInfo>> getAllListAdmin(){
	  
		  List<UserInfo> list = listService.getAllListAdmin();
		  
		  ResponseEntity<List<UserInfo>> entity = new ResponseEntity<List<UserInfo>>(list,HttpStatus.OK);
		  
		  		return entity; 
	  }



	  @CrossOrigin
	  @DeleteMapping("/{u_idx}") 
	  public ResponseEntity<String> deleteMember(@PathVariable("u_idx") int u_idx) {
	  
	  return new ResponseEntity<String>(deleteService.memberDeleteAdmin(u_idx)>0?"SUCCESS":"FAIL",HttpStatus.OK);
	  
	  }
	  




}



