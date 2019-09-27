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

import com.teamrun.runbike.party.domain.PartyInfo;
import com.teamrun.runbike.party.domain.PartyUserInfo;
import com.teamrun.runbike.party.domain.ReadyInfo;
import com.teamrun.runbike.party.domain.RequestParticipationInsert;
import com.teamrun.runbike.party.domain.RequestPartyCreate;
import com.teamrun.runbike.party.domain.RequestPartyEdit;
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
		
			// 로그인 되었다는 전제
			count = partyInfoService.hasParty(u_idx);

			if (count > 0) {
				p_num = partyInfoService.getPartyNum(u_idx); // 그 방번호 얻어오기

				view = "redirect:/party/" + p_num; // 그 방 페이지로 넘어감
			}

		return view;
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
		//PartyUserInfo partyUserInfo = partyInfoService.get
		model.addAttribute("partyInfo", partyInfo);
		
		return "party/partyRoomIng";
	}
	
	// 라이딩 시작하여 시작시간 업데이트하기 // 왠지는 몰라도
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/{p_num}/start", method = RequestMethod.GET)
	public int startParty(@PathVariable int p_num) {
		System.out.println("start 컨트롤러 들어옴");
		int resultCnt = partyInfoService.updatePartyStartTime(p_num);
		System.out.println("start 컨트롤러 resultCnt"+resultCnt);
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
}
