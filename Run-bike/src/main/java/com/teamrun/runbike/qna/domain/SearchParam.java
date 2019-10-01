package com.teamrun.runbike.qna.domain;


public class SearchParam {
	
	// 타입명
	private String stype;
	private String keyword;
	
	
	public SearchParam() {}
	
	
	public SearchParam(String stype, String keyword) {
		super();
		this.stype = stype;
		this.keyword = keyword;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	@Override
	public String toString() {
		return "SearchParam [stype=" + stype + ", keyword=" + keyword + "]";
	}

	
	
	
	
	
	
	
	
}