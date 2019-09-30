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
	// public List<Message> pageListAll(Map<String, Object> param);
	 
	 //게시물 개수
	 public int selectTotalCount(SearchParam searchParam);
	 
	 
	// 게시물의 LIST :  동적 쿼리로 검색의 결과 까지 처리
		//public List<MemberInfo> selectList(int index, int count);
		public List<Message> selectList(Map<String, Object> params);

	/* 답글---------------------------------------------------------------- */
	 
	 //답글입력하기
	// public int replyInsert(Message message);
	 
	 //q_num과 group의 번호가 같게 update
	 //public int numsameupdate(int q_num);
	 
	 //답글 작성 폼에 해당 원글의 정보가져오기
	// public Message replyselectbyqnum(int q_num);
	 
	 //글 번호가 같을때 step수 1증가
	 //public int replyUpdate(int q_num_group);
	 
	/* -----------방명록 paging ---------------------------*/
	public int selectCount();
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 

	 
	 
	 
	 
	/* public List<Message> selectList(Map<String, Object> params); */
	 



	







	
	
}
