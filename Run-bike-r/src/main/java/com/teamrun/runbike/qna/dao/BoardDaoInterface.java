package com.teamrun.runbike.qna.dao;

import java.util.List;
import java.util.Map;

import com.teamrun.runbike.qna.domain.Message;
import com.teamrun.runbike.qna.domain.Reply;
import com.teamrun.runbike.qna.domain.SearchParam;

public interface BoardDaoInterface {

	//게시글 작성
	public int insertBoard(Message message);

	
	//게시글 전체 리스트 출력 
	 public List<Message> selectAllList(); 
	
	
	 // 게시글 삭제(글번호로)
	 public int boardDelete(int q_num);
	 
	 
	 //게시글 수정(글번호로 message 찾기)
	 public Message selectMessageByNum(int q_num);
	 //게시글 수정
	 //public int boardUpdate(Message message);
	 public Integer boardUpdate(Message message);
	 
	 
	 
	 //글번호로 해당 게시물찾아 상세보기
	 public Message detail(int q_num);
	 
	 
	 
	 
	/* 새 테이블 답글 -------------------------------*/
	 
	 //답글입력
	 public int replywrite(Reply replyinfo);
	 
	 //해당글의 답글들 리스트 출력 
	 public List<Reply> selectReplyListAll(int q_num);
	 
	 //답글 삭제
	 public int replyDelete(int rp_num);
	 
	 
	 
	 
	 
	 
	/*-------------페이지, 검색------------------*/
	 
	 //게시물 총 개수
	 public int selectTotalCount(SearchParam searchParam);
	 
	 
	// 게시물의 LIST :  동적 쿼리로 검색의 결과 까지 처리
	public List<Message> selectList(Map<String, Object> params);





	
	
}
