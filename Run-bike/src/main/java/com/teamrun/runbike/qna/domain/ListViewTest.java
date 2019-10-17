package com.teamrun.runbike.qna.domain;

import java.util.List;

public class ListViewTest {
	
	private List<Message> boardlistList;
	private int totalCount;
	private int no;
	private int currentPageNumber;
	private int pageTotalCount;
	
	

	public List<Message> getBoardlistList() {
		return boardlistList;
	}
	public void setBoardlistList(List<Message> boardlistList) {
		this.boardlistList = boardlistList;
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
