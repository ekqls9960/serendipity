package com.example.demo.web.login.service;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import com.example.demo.domain.Member.Member;
import com.example.demo.domain.Member.mapper.MemberMapper;
import com.example.demo.web.mail.MailService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {
	
	private final MemberMapper memberMapper;
	private final MailService mailService;


	@Override
	public String findEmail(String nickname, String phoneNum) {
		String email = null;
		Member member = memberMapper.selectByNickname(nickname);
		if(member != null) {
			if(member.getPhoneNum().equals(phoneNum)) {
				email = member.getEmail();
				return email;
		}
		}
		return email;
	}


	@Override
	public String changePwd(String email, String phoneNum) {

		
		Member member = memberMapper.selectByEmail(email);
		if(member != null) {
			if(member.getPhoneNum().equals(phoneNum)) {
				//메일로 임시비번발송
				String tmpPwd = RandomStringUtils.randomAlphanumeric(8);
				mailService.sendTmpPwd(email, tmpPwd);
				//db비번 정보 바꾸기
				memberMapper.updatePwd(email, tmpPwd);
				return tmpPwd;
			}
		}
		
		return null;
	}

	
	

	@Override
	public Member login(String email, String pwd) {
		Member member = memberMapper.selectByEmail(email);

		if(member != null) {

			if(member.getPwd().equals(pwd)) {
				//로그인성공
				return member;
			}
		}
		
		
		return null;
	}

	
}
