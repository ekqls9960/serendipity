package com.example.demo.web.member.service;

import java.util.List;

import com.example.demo.domain.Member.Member;

public interface MemberService {
	
	void join(Member member);
	Member findById(Long id);
	Member findByEmail(String email);
	Member findByPhoneNum(String phoneNum);
	Member findByNickname(String nickname);
	void changeEmailAuth(String email);
	void changePwd(String email, String newPwd);
	void update(String email, Member member);
	List<Member> findAll();
}
