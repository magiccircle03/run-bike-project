package com.teamrun.runbike.party.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamrun.runbike.party.domain.FinishInfo;
import com.teamrun.runbike.party.domain.PartyInfo;
import com.teamrun.runbike.party.domain.PartyUserInfo;
import com.teamrun.runbike.party.domain.ReadyInfo;
import com.teamrun.runbike.party.domain.RequestParticipationInsert;
import com.teamrun.runbike.party.domain.RequestPartyCreate;
import com.teamrun.runbike.party.domain.RequestPartyEdit;
import com.teamrun.runbike.party.service.FinishService;
import com.teamrun.runbike.party.service.PartyCreateService;
import com.teamrun.runbike.party.service.PartyDeleteService;
import com.teamrun.runbike.party.service.PartyEditService;
import com.teamrun.runbike.party.service.PartyInfoService;
import com.teamrun.runbike.party.service.PartyJoinService;
import com.teamrun.runbike.party.service.PartyListService;
import com.teamrun.runbike.party.service.PartyMasterService;
import com.teamrun.runbike.party.service.ReadyService;
import com.teamrun.runbike.user.domain.LoginInfo;

@Controller
@RequestMapping("/party")
public class PartyMainContoller {

	@Autowired
	private PartyCreateService createService;

	@Autowired
	private PartyJoinService joinService;

	@Autowired
	private PartyListService listService;

	@Autowired
	private PartyInfoService partyInfoService;

	@Autowired
	private ReadyService readyService;
	
	@Autowired
	private FinishService finishService;

	@Autowired
	private PartyMasterService masterService;

	@Autowired
	private PartyDeleteService deleteService;

	@Autowired
	private PartyEditService editService;

	// 인덱스에서 함께하기로 갈 때 분기처리(참여한 방이 있냐없냐 따라서)
	@RequestMapping(method = RequestMethod.GET)
	public String getMain(HttpServletRequest request, Model model) {

		String view = "party/partyLobby";
		int count = 0;
		int p_num = 0;
		int u_idx = 0;

		// 세션에서 u_idx 가져옴
		HttpSession session = request.getSession(false);

		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		u_idx = loginInfo.getU_idx();

		// 로그인 되었다는 전제로, 유저가 속한, 닫히지 않은 파티의 수를 구한다
		count = partyInfoService.hasParty(u_idx);

		if (count > 0) { // 그러한 파티가 있다면 
			p_num = partyInfoService.getPartyNum(u_idx); // 그 방번호 얻어오기
			
			PartyInfo partyInfo = partyInfoService.getPartyInfoOne(p_num);
			System.out.println("시작 시간 > "+partyInfo.getP_start_time());
			if(partyInfo.getP_start_time() != null) {
				view = "redirect:/party/" + p_num + "/ing";
			}else {
				view = "redirect:/party/" + p_num; // 그 방 페이지로 넘어감
			}
		}

		return view;
	}

	// ajax로 가져올 때 사용할 방의 정보 
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}", method = RequestMethod.GET)
	public PartyInfo getPartyInfo(@PathVariable int p_num) {
		PartyInfo partyInfo = partyInfoService.getPartyInfoOne(p_num);
		return partyInfo;
	}

	// 방을 보여줌, 방 넘버를 가지고 간다
	@RequestMapping(value = "/{p_num}", method = RequestMethod.GET)
	public String getPartyPage(@PathVariable int p_num, Model model) {
		PartyInfo partyInfo = partyInfoService.getPartyInfoOne(p_num);
		model.addAttribute("partyInfo", partyInfo);
		return "party/partyRoom";
	}

	// 진행중인 파티의 현재 정보 페이지로 가기
	@RequestMapping(value = "/{p_num}/ing", method = RequestMethod.GET)
	public String getPartyIngPage(@PathVariable int p_num, Model model) {
		PartyInfo partyInfo = partyInfoService.getPartyInfoOne(p_num);
		// PartyUserInfo partyUserInfo = partyInfoService.get

		model.addAttribute("partyInfo", partyInfo);

		return "party/partyRoomIng";
	}
	
	// 진행중인 파티의 채팅 페이지로 가기
	@RequestMapping(value = "/{p_num}/chat", method = RequestMethod.GET)
	public String getPartyChatPage(@PathVariable int p_num, Model model) {
		return "party/partyChat";
	}

	// 라이딩 시작하여 시작시간 업데이트하기 // 왠지는 몰라도
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/{p_num}/start", method = RequestMethod.GET)
	public int startParty(@PathVariable int p_num) {
		System.out.println("start 컨트롤러 들어옴");
		int resultCnt = partyInfoService.updatePartyStartTime(p_num);
		System.out.println("start 컨트롤러 resultCnt" + resultCnt);
		return resultCnt;
	}

	// 수정 페이지로 가기
	@RequestMapping(value = "/{p_num}/edit", method = RequestMethod.GET)
	public String getEditPartyForm(@PathVariable int p_num, Model model) {
		PartyInfo partyInfo = partyInfoService.getPartyInfoOne(p_num);
		model.addAttribute("partyInfo", partyInfo);
		return "party/partyEdit";
	}

	// 수정 완료
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/{p_num}/edit", method = RequestMethod.POST)
	public int editParty(@PathVariable int p_num, @RequestBody RequestPartyEdit editRequest) {
		System.out.println("컨트롤러 들어옴");
		int resultCnt = 0;

		editRequest.setP_num(p_num);
		System.out.println(editRequest);
		resultCnt = editService.editParty(editRequest);

		return resultCnt;
	}

	// 방을 삭제한다
	@RequestMapping(value = "/{p_num}", method = RequestMethod.DELETE)
	@ResponseBody
	public int deleteParty(@PathVariable int p_num) {
		int resultCnt = 0;
		resultCnt = deleteService.deleteParty(p_num);
		return resultCnt;
	}

	// 방에 속한 유저 정보 - 일단 그냥 다 불러오고 나중에 정리하자
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}/user", method = RequestMethod.GET)
	public List<PartyUserInfo> getPartyUserInfo(@PathVariable int p_num) {
		List<PartyUserInfo> partyUserList = partyInfoService.getPartyUserList(p_num);
		return partyUserList;
	}

	// 그 방의 마스터 u_idx 가져오기
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}/master", method = RequestMethod.GET)
	public int getPartyMasterIdx(@PathVariable int p_num) {
		int masterIdx = partyInfoService.getPartyMasterIdx(p_num);
		return masterIdx;
	}

	// 방에 참여하기
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}", method = RequestMethod.POST)
	public int joinParty(@PathVariable int p_num, @RequestParam("u_idx") int u_idx) {
		int resultCnt = 0;
		// System.out.println(p_num+","+u_idx);
		RequestParticipationInsert participationRequest = new RequestParticipationInsert(u_idx, p_num, 'N');
		resultCnt = joinService.insertParticipation(participationRequest);
		return resultCnt;
	}
	
	// 해당회원 끝났는지
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/isEnd", method = RequestMethod.GET)
	public char isEnd(@RequestParam("u_idx") int u_idx, @RequestParam("p_num") int p_num) {
		int resultCnt=-1;
		resultCnt = finishService.isEnd(u_idx, p_num);
		return resultCnt==1?'Y':'N';
	}
	
	// 방에서 나가기
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}", method = RequestMethod.DELETE)
	public int exitParty(@PathVariable int p_num, @RequestBody JSONObject u_idx_str) {
		int resultCnt = 0;
		// System.out.println(p_num+","+u_idx_str+","+u_idx_str.get("u_idx"));
		int u_idx = Integer.parseInt((String) u_idx_str.get("u_idx"));
		resultCnt = joinService.deleteParticipation(p_num, u_idx);
		return resultCnt;
	}

	// 방 만들기
	@CrossOrigin
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public int createParty(@RequestBody RequestPartyCreate createRequest) {
		System.out.println(createRequest);
		int resultCnt = -1;
		int key = createService.partyInsert(createRequest);
		RequestParticipationInsert participationRequest = new RequestParticipationInsert(createRequest.getU_idx(), key,
				'Y'); // 방장 참여
		resultCnt = joinService.insertParticipation(participationRequest);
		return resultCnt;
	}

	// 방 리스트
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public List<PartyInfo> getAllListClosedN() {
		return listService.getAllListClosedN(); // 열려있는 방만 보여주기
	}

	// 준비 상태 변경
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/{p_num}/finishOne", method = RequestMethod.POST)
	public int setFinishEnd(@PathVariable("p_num") int p_num, @RequestParam("u_idx") int u_idx,
			@RequestParam("finishYN") String finishYN) {
		FinishInfo finishInfo = new FinishInfo(p_num, u_idx, finishYN.charAt(0));
		int resultCnt = finishService.updateFinish(finishInfo);
		return resultCnt;
	}
	
	// 개인 종료
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/ready", method = RequestMethod.POST)
	public int setReadyY(@RequestParam("p_num") int p_num, @RequestParam("u_idx") int u_idx,
			@RequestParam("readyYN") String readyYN) {
		ReadyInfo readyInfo = new ReadyInfo(p_num, u_idx, readyYN.charAt(0));
		// System.out.println(readyInfo);
		int resultCnt = readyService.updateReady(readyInfo);
		return resultCnt;
	}
	
	

	// 현재 방의 참여 인원수
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}/usercount", method = RequestMethod.GET)
	public int getPartyUserCount(@PathVariable int p_num) {
		int curUser = -1;
		curUser = partyInfoService.getPartyUserCount(p_num);
		return curUser;
	}

	// 준비하지 않은 사람의 수를 구해온다
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}/notReadyUsercount", method = RequestMethod.GET)
	public int getNotReadyUsercount(@PathVariable int p_num) {
		int curUser = -1;
		curUser = readyService.getNotReadyUsercount(p_num);
		return curUser;
	}
	
	// 끝나지 않은 사람 수를 구해온다
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}/notEndUsercount", method = RequestMethod.GET)
	public int getNotEndUsercount(@PathVariable int p_num) {
		int curUser = -1;
		curUser = finishService.getNotEndUsercount(p_num);
		return curUser;
	}

	// 방장 위임
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}/master", method = RequestMethod.PUT)
	public String changeMaster(@PathVariable int p_num, @RequestBody JSONObject u_idx_str) {
		String result = "";
		int u_idx = Integer.parseInt(u_idx_str.get("u_idx_t").toString());
		result = masterService.changeMaster(p_num, u_idx);
		return result;
	}

	// 방 종료
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/room/{p_num}", method = RequestMethod.PUT)
	public int endParty(@RequestBody JSONObject p_num_str) {
		int result = -1;
		int p_num = Integer.parseInt(p_num_str.get("p_num").toString());
		result = finishService.endParty(p_num);
		return result;
	}
	
}
