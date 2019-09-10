package com.teamrun.runbike.party.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.party.domain.PartyInfo;
import com.teamrun.runbike.party.domain.RequestPartyCreate;
import com.teamrun.runbike.party.service.PartyCreateService;

@Controller
@RequestMapping("/party")
public class PartyMainContoller {

	@Autowired
	private PartyCreateService createService;
	
	//@Autowired
	//private PartyListService listService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getMain() {
		return "party/partyLobby";
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public String createParty(@RequestBody RequestPartyCreate createRequest) {
		System.out.println(createRequest);
		int result = createService.partyInsert(createRequest);
		return result>0?"success":"fail";
	}

//	@CrossOrigin
//	@ResponseBody
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public List<PartyInfo> getAllList(){ 
//		return listService.getAllList();
//	} 
	
	
}
