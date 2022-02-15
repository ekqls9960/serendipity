package com.example.demo.web.poem.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.domain.theme.Theme;
import com.example.demo.web.member.form.MemberEditForm;
import com.example.demo.web.poem.form.PoemWriteForm;
import com.example.demo.web.poem.service.PoemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/poem")
@Slf4j //logging
public class PoemController {
	
	@Autowired
	PoemService poemService;
	
	@GetMapping("/write")
	public String writeForm(Model model) {
		PoemWriteForm form = new PoemWriteForm();
		model.addAttribute("poemWriteForm", form);
		//모든 주제 정보를 담아 전송
		List<Theme> themelist = poemService.themelist();
		model.addAttribute("themelist", themelist);
		return "poem/writeForm";
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
		}
		
		
		
		return "redirect:/member/mypage";
		}
	
	
	
	
	
}