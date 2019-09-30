package com.teamrun.runbike.admin.domain;

import java.util.List;

import com.teamrun.runbike.user.domain.UserInfo;


public class ListViewAdmin {
	
	
	private List<UserInfo> memberList;
	private int totalCount ;
	private int no;
	private int currentPageNumber;
	private int pageTotalCount;
	
	
	
	public List<UserInfo> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<UserInfo> memberList) {
		this.memberList = memberList;
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
