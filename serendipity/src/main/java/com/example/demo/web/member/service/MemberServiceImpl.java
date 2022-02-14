package com.example.demo.web.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.Member.EmailAuth;
import com.example.demo.domain.Member.Member;
import com.example.demo.domain.Member.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void join(Member member) {
		memberMapper.save(member);
	}

	@Override
	public Member findById(Long id) {
		Member member = memberMapper.selectById(id);			
		return member;
	}

	@Override
	public Member findByEmail(String email) {
		Member member = memberMapper.selectByEmail(email);
		return member;
	}

	@Override
	public Member findByPhoneNum(String phoneNum) {
		Member member = memberMapper.selectByPhoneNum(phoneNum);
		return member;
	}

	@Override
	public Member findByNickname(String nickname) {
		Member member = memberMapper.selectByNickname(nickname);
		return member;
	}

	@Override
	public void changeEmailAuth(String email) {

		Member member = findByEmail(email);
		member.setIsEmailAuth(EmailAuth.Y);
		memberMapper.updateIsEmailAuth(email, member);
	}
	
	
}
