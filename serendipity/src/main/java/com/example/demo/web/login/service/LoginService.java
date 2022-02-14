package com.example.demo.web.login.service;

import com.example.demo.domain.Member.Member;

public interface LoginService {

	Member login(String email, String pwd);
	
	String findEmail(String nickname, String phoneNum);
	String changePwd(String email, String phoneNum);
}
