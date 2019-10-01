package com.teamrun.runbike.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.teamrun.runbike.qna.domain.Reply;
import com.teamrun.runbike.qna.domain.ReplyRequest;
import com.teamrun.runbike.qna.service.ReplyDeleteService;
import com.teamrun.runbike.qna.service.ReplyListService;
import com.teamrun.runbike.qna.service.ReplyWriteService;

@CrossOrigin
@RestController
@RequestMapping("/rest/reply")
public class ReplyController {

	@Autowired
	private ReplyWriteService replywriteService;
	
	@Autowired
	private ReplyListService replylistService;
	
	@Autowired
	private ReplyDeleteService replydeleteService;
	

	/* 답변글작성 */
	@PostMapping
	public ResponseEntity<String> replywrite(ReplyRequest replyRequest, HttpServletRequest request) {

		System.out.println("답변 작성 컨트롤러: "+replyRequest);

		int cnt = replywriteService.replywrite(replyRequest, request);

		return new ResponseEntity<String>(cnt > 0 ? "SUCCESS" : "FAIL", HttpStatus.OK);

	}
	


	
	/* 답변글 리스트 출력 */ 
	@ResponseBody 
	@GetMapping("/reply/{q_num}")
	public List<Reply> replyList(@PathVariable("q_num") int q_num){
		
		List<Reply> list = replylistService.replyListData(q_num);
		
		System.out.println("답변리스트 컨트롤러 :"+list);
		return list;
	}
	
	

	
	
	/* 답변글 삭제 */
	@DeleteMapping("del/{rp_num}")
	public ResponseEntity<String> replydelete(@PathVariable("rp_num") int rp_num) {

		return new ResponseEntity<String>(replydeleteService.ReplyDelete(rp_num) > 0 ? "SUCCESS" : "FAIL",HttpStatus.OK);

	}

	
	
	
	
	
	
	
}
