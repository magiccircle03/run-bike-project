package com.weovercome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.weovercome.domain.MemberInfo;

public interface MemberMapper {

	@Select("select * from member order by idx")
	public List<MemberInfo> selectAll();
	
	public MemberInfo selectMemberById(String uid);
	
}
