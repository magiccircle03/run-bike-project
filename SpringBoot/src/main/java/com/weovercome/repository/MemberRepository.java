package com.weovercome.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.weovercome.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {
	
	public MemberEntity findbyIdx(Long idx);
	public List<MemberEntity> findByUnameLike(String name);
}
