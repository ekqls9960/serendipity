package com.example.demo.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.domain.Member.Member;
import com.example.demo.domain.theme.Theme;
import com.example.demo.web.member.service.MemberService;
import com.example.demo.web.theme.service.ThemeService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MainController {
	@Autowired
	ThemeService themeService;

	@Autowired
	MemberService memberService;
	
	@GetMapping("/")
	public String main(Model model,HttpServletRequest request, HttpSession session) {
		
		List<Theme> list = themeService.findAll();
		model.addAttribute("list", list);
		model.addAttribute("theme", new Theme());
		
		//로그인 시켜두기
//		Member member = memberService.findById(1L);
//		session.setAttribute("member",member );
		
		return "main";
	}
	
	@GetMapping("/2")
	public String main2(Model model,HttpServletRequest request) {
		
		return "main2";
	}
}
