package com.teamrun.runbike.party.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PartyMainContoller {
	@RequestMapping(value = "/party", method = RequestMethod.GET)
	public String getMain() {
		return "party/partyLobby";
	}
}
