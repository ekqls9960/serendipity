package com.example.demo.web.login.controller;

import javax.servlet.http.HttpSession;

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
import com.example.demo.web.login.form.FindEmailForm;
import com.example.demo.web.login.form.FindPwdForm;
import com.example.demo.web.login.form.LoginForm;
import com.example.demo.web.login.service.LoginService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
@Slf4j 
public class LoginController {

	private final LoginService loginService;
	
	
	@GetMapping("/findPwd")
	public String findPwdForm(Model model) {
		model.addAttribute("findPwdForm", new FindPwdForm());
		
		return "login/findPwdForm";
	}
	
	
	
	
	@PostMapping("/findPwd")
	public String findPwd(@Validated @ModelAttribute("findPwdForm") FindPwdForm form, BindingResult bindingResult, Model model) {

		if(bindingResult.hasErrors()){
            log.info("errors={}", bindingResult);
            return "login/findPwdForm";
        }
		
		String tmpPwd = loginService.changePwd(form.getEmail(), form.getPhoneNum());
		if(tmpPwd == null) {
			bindingResult.reject("NotExistingMember");
			return "login/findPwdForm";
		}
		
		model.addAttribute("email", form.getEmail());
		
		return "login/findPwd";
	}
	
	@GetMapping("/findEmail")
	public String findEmailForm(Model model) {
		model.addAttribute("findEmailForm", new FindEmailForm());
		
		return "login/findEmailForm";
		
	}
	
	
	
	
	@PostMapping("/findEmail")
	public String findEmail(@Validated @ModelAttribute("findEmailForm") FindEmailForm form, 
			BindingResult bindingResult, Model model) {
	
		
		if(bindingResult.hasErrors()){
            log.info("errors={}", bindingResult);
            return "login/findEmailForm";
        }
		
			String email = loginService.findEmail(form.getNickname(), form.getPhoneNum());

		   if (email==null) {
	        	bindingResult.reject("NotExistingMember");
	        	return "login/findEmailForm";
	        }
		   
		//정보 일치시
		model.addAttribute("email", email);
		
		return "login/findEmail";
		
	}
	
	
	
	
	
	@GetMapping("/logout")
	public String logoutForm(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		session.invalidate();
		
		return "login/logoutForm";
		
	}
	
	
	
	
	@GetMapping("")
	public String loginForm(Model model) {
		model.addAttribute("loginForm", new LoginForm());
		
		return "login/loginForm";
		
	}
	
	
	
	@PostMapping("")
	public String loginForm(@Validated @ModelAttribute("loginForm") LoginForm form, BindingResult bindingResult, Model model
			,HttpSession session) {

		if(bindingResult.hasErrors()){
            log.info("errors={}", bindingResult);
            return "login/findPwdForm";
        }
		
		Member member = loginService.login(form.getEmail(), form.getPwd());

		//계쩡이 없거나 비번 불일치
		if(member == null) {
			bindingResult.reject("NotExistingMember");
			return "login/loginForm";
		}
		
		//이메일 인증 전 계정
		if(member.getIsEmailAuth().equals(EmailAuth.N)) {
			bindingResult.reject("Unauthorized");
			return "login/loginForm";
		}
		
		//로그인성공
		model.addAttribute("member", member);
		session.setAttribute("member", member);
		return "redirect:/";
		
	}
	
	
	
	
	
	
}
