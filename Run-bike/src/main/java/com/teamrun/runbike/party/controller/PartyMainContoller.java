package com.teamrun.runbike.party.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String getMain(HttpServletRequest request) {
		String view = "party/partyLobby";
		int count = 0;
		int p_num = 0;
		int u_idx = 72;
		// 세션에서 u_idx 가져옴
		// HttpSession session = request.getSession(false);
		// LoginInfo loginInfo = session.getAttribute("loginInfo");
		// u_idx = loginInfo.getU_idx();
		
		// 로그인 안 되어있으면 로그인 페이지로 보냄
		// view="";
		
		// 로그인 되었다는 전제
		count = listService.hasParty(u_idx);
		
		//System.out.println("hasParty count : "+count);
		
		if(count>0) {
			p_num = listService.getPartyNum(u_idx); // 그 방번호 얻어오기
			view = "redirect:/party/room/"+p_num; // 그 방 페이지로 넘어감
		}
		
		return view;
	}
	
	@RequestMapping(value="/room/{p_num}", method = RequestMethod.GET)
	public String getRoom(@PathVariable int p_num, Model model) {
		String view = "party/partyRoom";
		model.addAttribute("p_num",p_num);
		return view;
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
	
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/nav", method = RequestMethod.GET)
	public String hasParty(@RequestBody String u_idx){ 
		String result = "";
		int resultCnt = listService.hasParty(Integer.parseInt(u_idx));
		result+=resultCnt;
		return result;
	} 
	
}
