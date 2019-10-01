package com.teamrun.runbike.qna.domain;

import java.util.List;


public class ListViewBoardData {
		
		private List<Message> boardList;
		//총 게시글 수
		private int totalCount;
		private int no;
		//현재 페이지번호
		private int currentPageNumber;
		//총 페이지 수
		private int pageTotalCount;
		
		
		
		
		
		public ListViewBoardData() {}
		
		
		public ListViewBoardData(List<Message> boardList, int totalCount, int no, int currentPageNumber,
				int pageTotalCount) {
			super();
			this.boardList = boardList;
			this.totalCount = totalCount;
			this.no = no;
			this.currentPageNumber = currentPageNumber;
			this.pageTotalCount = pageTotalCount;
		}
		
		
		public List<Message> getBoardList() {
			return boardList;
		}
		public void setBoardList(List<Message> boardList) {
			this.boardList = boardList;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public int getCurrentPageNumber() {
			return currentPageNumber;
		}
		public void setCurrentPageNumber(int currentPageNumber) {
			this.currentPageNumber = currentPageNumber;
		}
		public int getPageTotalCount() {
			return pageTotalCount;
		}
		public void setPageTotalCount(int pageTotalCount) {
			this.pageTotalCount = pageTotalCount;
		}
		

		
		

		
		
		
		
		
		
		
		
		

	}
	
