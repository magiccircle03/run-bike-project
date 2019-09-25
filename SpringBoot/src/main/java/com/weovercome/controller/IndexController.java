package com.weovercome.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weovercome.domain.MemberInfo;
import com.weovercome.entity.MemberEntity;
import com.weovercome.mapper.MemberMapper;
import com.weovercome.repository.MemberRepository;

@Controller
public class IndexController {

	@Autowired
	private SqlSessionTemplate template;
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private MemberRepository repository;
	
	@RequestMapping("/")
	@ResponseBody
	public String index() {
		return "Spring Boot Start";
	}
	
	@RequestMapping("/hello")
	public void hello() {
		
	}

	@RequestMapping("/memberInfo")
	public void selectMemberById() {
		
		mapper = template.getMapper(MemberMapper.class);
	
		MemberInfo info = mapper.selectMemberById("superduper12@naver.com");
		
		System.out.println(info);
	}
	
	@RequestMapping("/members")
	@ResponseBody
	public List<MemberInfo> selectMembers(){
		
		mapper = template.getMapper(MemberMapper.class);
		
		List<MemberInfo> info = mapper.selectAll();
		
		for(MemberInfo memberInfo : info) {
			System.out.println(memberInfo);
		}
		
		return info;
	}
	
	@RequestMapping("/member/list")
	@ResponseBody
	public List<MemberEntity> getMemberList(){
		List<MemberEntity> list = null;
		
		list = repository.findAll();
		
		for(MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
		return list;
	}
	
	
	  @RequestMapping("/member/insert")
	  
	  @ResponseBody public String insertMember() {
	  
	  MemberEntity entity = new MemberEntity();
	  entity.setUid("superduper12@hanmail.net"); entity.setUname("nunu");
	  entity.setUpw("12345");
	  
	  return repository.saveAndFlush(entity).toString();
	  
	  }
	 
	
	@RequestMapping("/member/edit/{idx}")
	@ResponseBody
	public String editMember(@PathVariable("idx") int idx) {
		
		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		entity.setUid("sososo@sososo");
		entity.setUname("soso");
		entity.setUpw("12345");
		
		return repository.saveAndFlush(entity).toString();	
	}
	
	@RequestMapping("/member/delete/{idx}")
	@ResponseBody
	public String delete(@PathVariable("idx") int idx) {
		
		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		
		repository.delete(entity);
		
		return "delete success";	
	}
	
	@RequestMapping("/member/member/{idx}")
	@ResponseBody
	public MemberEntity getMemberInfo(@PathVariable("idx") long idx) {
		
		MemberEntity entity = null;
		
		entity = repository.findbyIdx(idx);
		
		System.out.println(entity);
		
		return entity;	
	}
	
	@RequestMapping("/member/memberbyname/{name}")
	@ResponseBody
	public List<MemberEntity> getMemberInfo(@PathVariable("name") String name) {
		
		List<MemberEntity> entitys = null;
		
		entitys = repository.findByUnameLike("%" + name + "%");
		
		System.out.println(entitys);
		
		return entitys;	
	}
}
