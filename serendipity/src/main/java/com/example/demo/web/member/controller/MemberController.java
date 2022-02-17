package com.example.demo.web.member.controller;


import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Member.EmailAuth;
import com.example.demo.domain.Member.Member;
import com.example.demo.web.login.form.LoginForm;
import com.example.demo.web.mail.MailService;
import com.example.demo.web.member.form.MemberEditForm;
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
	private final MailService mailService;
	
	
	@GetMapping("/edit")
	public String editForm(Model model, HttpSession session) {
		MemberEditForm form = new MemberEditForm();
		model.addAttribute("memberEditForm", form);
		
		return "member/editForm";
		}
	
	
	@PostMapping("/edit")
	public String edit(@Validated @ModelAttribute("memberEditForm") MemberEditForm form, 
			BindingResult bindingResult, Model model, HttpSession session) {
		
		
		if(bindingResult.hasErrors()){
            log.info("errors={}", bindingResult);
            return "member/editForm";
        }

		//비밀번호를 입력했는지 확인
		if(!form.getPwd().equals("")) {
			
			//비밀번호 확인과 비밀번호가 일치하지 않는다면 바인딩 후 이동
			if(!form.getPwd().equals(form.getConfirmPwd())) {
		        	bindingResult.rejectValue("confirmPwd", "notMatching"); 
		        	log.info("errors={}", bindingResult); // log 확인
		        	return "member/editForm";
		    }
			
			//비번이 일치하면 비번 바꿔줌.
			memberService.changePwd(form.getEmail(), form.getPwd());
		}
		
		//다른 정보 다 바꿔줌
		Member member = memberService.findByEmail(form.getEmail());

		System.out.println("여기---수정중---" + form.getPostCode());
		member.setNickname(form.getNickname());
		member.setRoadAddr(form.getRoadAddr());
		member.setDetailAddr(form.getDetailAddr());
		member.setPostCode(form.getPostCode());
		memberService.update(member.getEmail(), member);
		//새 정보로 세션 업데이트
		session.setAttribute("member", member);
		
		return "redirect:/member/mypage";
		}
	
	
	
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		
		return "member/mypage";
		
	}
	
	
	
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
	
		//이메일 중복 검증
		if(memberService.findByEmail(form.getEmail()) != null){
			bindingResult.rejectValue("email", "duplicated");
			log.info("errors={}", bindingResult);
			System.out.println("email중복~~~~~~~~~");
			return "member/joinForm";
		}
		
		//닉네임 중복 검증
		if(memberService.findByNickname(form.getNickname()) != null){
			bindingResult.rejectValue("nickname", "duplicated");
			log.info("errors={}", bindingResult);
			System.out.println("nickname중복~~~~~~~~~");
			return "member/joinForm";
		}
		
		
		//폰번호 중복 검증
		if(memberService.findByPhoneNum(form.getPhoneNum()) != null){
			bindingResult.rejectValue("phoneNum", "duplicated");
			log.info("errors={}", bindingResult);
			System.out.println("phoneNum중복~~~~~~~~~");
			return "member/joinForm";
		}
		
		
		
		//메일 인증 코드 생성
		String emailAuthCode = RandomStringUtils.randomAlphanumeric(8);
		

		//db에 멤버정보 저장
		Member member = new Member();
		member.setEmail(form.getEmail());
		member.setEmailAuthCode(emailAuthCode);

		member.setRoadAddr(form.getRoadAddr());
		member.setDetailAddr(form.getDetailAddr());
		member.setPostCode(form.getPostCode());
		member.setIsEmailAuth(EmailAuth.N);
		member.setNickname(form.getNickname());
		member.setPhoneNum(form.getPhoneNum());
		member.setPwd(form.getPwd());
		
		//인증 메일 발송
		mailService.sendEmailAuthMail(form.getEmail(), emailAuthCode);
		model.addAttribute("email", form.getEmail());
		memberService.join(member);
		System.out.println("db에 저장완료");
		
		
		return "member/emailSent";
		
	}
	
	
	@GetMapping("/emailAuthCallBack")
	public String emailAuthCallBack(@RequestParam("email")String email, @RequestParam("emailAuthCode")String emailAuthCode, Model model) {
		System.out.println("email : " + email);
		System.out.println("emailAuthCode : " + emailAuthCode);

		if(memberService.findByEmail(email).getEmailAuthCode().equals(emailAuthCode)) {
			System.out.println("인증 코드가 일치함. 상태 바꿔드림");
			memberService.changeEmailAuth(email);
			model.addAttribute("loginForm", new LoginForm());
			model.addAttribute("state", "emailChecked");
	        return "login/loginForm";
		}
		return "redirect:/join";
		
	}
	
	
	
	
}
