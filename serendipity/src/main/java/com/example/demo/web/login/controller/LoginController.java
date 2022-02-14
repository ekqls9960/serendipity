package com.example.demo.web.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
@Slf4j 
public class LoginController {

	
	
	@GetMapping("")
	public String loginForm() {

		System.out.println("로그인폼 이동~~~~");
		return "login/loginForm";
		
	}
}
