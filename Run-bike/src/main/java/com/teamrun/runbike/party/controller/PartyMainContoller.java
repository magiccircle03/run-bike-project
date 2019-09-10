package com.teamrun.runbike.party.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.party.domain.RequestPartyCreate;
import com.teamrun.runbike.party.service.CreatePartyService;

@Controller
@RequestMapping("/party")
public class PartyMainContoller {

	@Autowired
	private CreatePartyService createService;
	
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

	
}
