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
import com.teamrun.runbike.party.domain.RequestParticipationInsert;
import com.teamrun.runbike.party.domain.RequestPartyCreate;
import com.teamrun.runbike.party.service.PartyCreateService;
import com.teamrun.runbike.party.service.PartyJoinService;
import com.teamrun.runbike.party.service.PartyListService;

@Controller
@RequestMapping("/party")
public class PartyMainContoller {

	
	@Autowired
	private PartyCreateService createService;

	@Autowired
	private PartyJoinService joinService;
	
	@Autowired
	private PartyListService listService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getMain() {
		return "party/partyLobby";
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public int createParty(@RequestBody RequestPartyCreate createRequest) {
		System.out.println(createRequest);
		int resultCnt=-1;
		int key = createService.partyInsert(createRequest);
		RequestParticipationInsert participationRequest = new RequestParticipationInsert(createRequest.getU_idx(), key, 'Y');
		resultCnt = joinService.participationInsertAsMaster(participationRequest);
		return resultCnt;
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public List<PartyInfo> getAllListClosedN(){ 
		return listService.getAllListClosedN(); // 열려있는 방만 보여주기
	} 
	
}
