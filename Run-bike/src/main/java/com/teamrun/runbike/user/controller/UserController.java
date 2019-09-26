package com.teamrun.runbike.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamrun.runbike.user.domain.RegisterInfo;
import com.teamrun.runbike.user.domain.RequestEditInfo;
import com.teamrun.runbike.user.service.DeleteService;
import com.teamrun.runbike.user.service.UpdateService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UpdateService updateService;
	
	@Autowired
	private DeleteService deleteService;
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String updateForm() {
		return "mypage";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public int update(MultipartHttpServletRequest request, RequestEditInfo editInfo) {
		int result = 0;
		
		System.out.println("userController"+result);
		System.out.println(editInfo);
		result = updateService.updateInfo(request,editInfo.getOldFile(), editInfo);
		
		return result;
	}
	
	@RequestMapping(value="chkMaster/{u_idx}")
	@ResponseBody
	public String chkMaster(@PathVariable("u_idx") int u_idx) {
		String chk = "";
		chk = deleteService.chkMaster(u_idx);
		System.out.println("chk : "+chk);
		return chk;
	}
	
	
	@RequestMapping("/delete/")
	public String delete() {
		return "mypage";
	}
	
	@RequestMapping(value="/delete/{u_idx}", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public int delete(@PathVariable("u_idx") int u_idx, HttpServletRequest request, @RequestParam("delete_u_pw")String pw) {
		int result = 0;
		
		result = deleteService.userDelete(request,u_idx, pw);
		
		return result;
	}
}
