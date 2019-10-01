package com.teamrun.runbike.qna.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.teamrun.runbike.qna.domain.ListViewBoardData;
import com.teamrun.runbike.qna.domain.Message;
import com.teamrun.runbike.qna.domain.RequestMemberEdit;
import com.teamrun.runbike.qna.domain.SearchParam;
import com.teamrun.runbike.qna.service.BoardDeleteService;
import com.teamrun.runbike.qna.service.BoardDetailService;
import com.teamrun.runbike.qna.service.BoardEditService;
import com.teamrun.runbike.qna.service.BoardListService;

@RestController
@RequestMapping("/rest/board")
public class RestFulController {

//	@Autowired
//	private BoardWriteService writeboardService;
//
	@Autowired
	private BoardListService boardlistService;

	@Autowired
	private BoardDeleteService boarddeleteService;

	@Autowired
	private BoardEditService boardeditService;

	@Autowired
	private BoardDetailService boarddetailService;

	
	
	
	
//	/* 문의글작성 */
//	@CrossOrigin
//	@PostMapping
//	public ResponseEntity<String> writeboard(RequestMemberWrite regRequest, HttpServletRequest request) {
//
//		System.out.println("문의글 작성 컨트롤러:"+regRequest);
//
//		int cnt = writeboardService.write(request, regRequest);
//
//		return new ResponseEntity<String>(cnt > 0 ? "SUCCESS" : "FAIL", HttpStatus.OK);
//
//	}
	
	

	

	/* 문의글리스트 */
	@CrossOrigin
	@GetMapping
	public ResponseEntity<List<Message>> getAllList() {

		List<Message> list = boardlistService.getAllList();

		ResponseEntity<List<Message>> entity = new ResponseEntity<List<Message>>(list, HttpStatus.OK);

		return entity;
	}
	
	
	/* 페이징 포함 문의리스트 */
	@GetMapping("/list")
	public ResponseEntity<ListViewBoardData> restboardList(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value="keyword", required = false) String keyword){
		

		SearchParam searchParam = null;
		
		if(stype!=null && keyword!=null && !stype.isEmpty() && !keyword.isEmpty() ) {
			searchParam = new SearchParam();
			searchParam.setStype(stype);
			searchParam.setKeyword(keyword);
			System.out.println("컨트롤러 : "+searchParam);
		}
		
		ListViewBoardData listData = boardlistService.getListData(page,searchParam);
		
		ResponseEntity<ListViewBoardData> entity = new ResponseEntity<ListViewBoardData>(listData,HttpStatus.OK);
		
		return entity;
	}
	

	

	/* 문의글 상세보기 */
	@CrossOrigin
	@GetMapping("/detail/{q_num}")
	public ResponseEntity<Message> getDetail(@PathVariable("q_num") int q_num) {
		Message messageInfo = boarddetailService.getDetaildata(q_num);
		return new ResponseEntity<Message>(messageInfo, HttpStatus.OK);

	}

	

	/* 문의글 수정 */

	/* 수정 정보 불러오기 */
	@CrossOrigin
	@GetMapping("/{q_num}")
	public ResponseEntity<Message> getBoardInfo(@PathVariable("q_num") int q_num) {

		Message info = boardeditService.getEditFormData(q_num);

		return new ResponseEntity<Message>(info, HttpStatus.OK);

	}


	/* 수정하기 */
	@CrossOrigin
	@PostMapping("/{q_num}")
	public ResponseEntity<String> editBoard(@PathVariable("q_num") int q_num,RequestMemberEdit editRequest) {

		System.out.println("수정컨트롤러:" + editRequest);
		
		//int t = Integer.parseInt(q_num);
		
		
		
		int cnt = boardeditService.edit(editRequest, null);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);

	}
	
	


	
	/* 문의글 삭제 */
	@CrossOrigin
	@DeleteMapping("del/{q_num}")
	public ResponseEntity<String> deleteboard(@PathVariable("q_num") int q_num) {

		return new ResponseEntity<String>(boarddeleteService.BoardDelete(q_num) > 0 ? "SUCCESS" : "FAIL",
				HttpStatus.OK);

	}
	
	


}