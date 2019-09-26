package com.weovercome.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "member")
public class MemberEntity {

	@Id
	@Column
	private long idx;
	@Column(length = 45, nullable = false)
	private String uid;
	@Column(length = 45, nullable = false)
	private String upw;
	@Column(length = 45, nullable = false)
	private String uname;
	@Column(length = 45, nullable = false)
	private String uphoto;
	public long getIdx() {
		return idx;
	}
	public void setIdx(long idx) {
		this.idx = idx;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUphoto() {
		return uphoto;
	}
	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}
	
	@Override
	public String toString() {
		return "MemberEntity [idx=" + idx + ", uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uphoto=" + uphoto
				+ "]";
	} 
}
