package com.example.demo.web.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.domain.Member.EmailAuth;
import com.example.demo.domain.Member.Member;
import com.example.demo.web.member.form.MemberJoinForm;
import com.example.demo.web.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
@Slf4j //logging
public class MemberController {
	
	private final MemberService memberService;
	
	
	@GetMapping("/join")
	public String joinForm(Model model) {

		MemberJoinForm form = new MemberJoinForm();
		model.addAttribute("memberJoinForm", form);
		return "member/joinForm";
		
	}

	@PostMapping("/join")
	public String join(@Validated @ModelAttribute("memberJoinForm") MemberJoinForm form, 
			BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()){
            log.info("errors={}", bindingResult);
            return "member/joinForm";
        }
		
		//비밀번호 확인과 비밀번호가 일치하지 않는다면 바인딩 후 이동
		if(!form.getPwd().equals(form.getConfirmPwd())) {
	        	bindingResult.rejectValue("confirmPwd", "notMatching"); 
	        	log.info("errors={}", bindingResult); // log 확인
	        	return "member/joinForm";
	    }
	
		System.out.println("email : " +form.getEmail() );
		System.out.println("pwd : " +form.getPwd() );
		
		Member member = new Member();
		member.setEmail(form.getEmail());
		member.setEmailAuthCode("dhdhdhdh");
		String addr = form.getPostCode() + " / " + form.getRoadAddr() + " / " + form.getDetailAddr();
		member.setAddr(addr);
		member.setIsEmailAuth(EmailAuth.N);
		member.setNickname(form.getNickname());
		member.setPhoneNum(form.getPhoneNum());
		member.setPwd(form.getPwd());
		
		System.out.println("------------정보 받아오는 데 문제 없음-------------");

		memberService.join(member);
		System.out.println("db에 저장완료");
		
		
		return "redirect:/";
		
	}
}
