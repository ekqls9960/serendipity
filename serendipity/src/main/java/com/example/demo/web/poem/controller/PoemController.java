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

import com.example.demo.domain.Member.Member;
import com.example.demo.domain.poem.Content;
import com.example.demo.domain.poem.Poem;
import com.example.demo.domain.theme.Theme;
import com.example.demo.response.Response;
import com.example.demo.web.member.form.MemberEditForm;
import com.example.demo.web.member.service.MemberService;
import com.example.demo.web.poem.form.PoemWriteForm;
import com.example.demo.web.poem.service.PoemService;
import com.example.demo.web.response.service.ResponseService;
import com.example.demo.web.theme.service.ThemeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/poem")
@Slf4j //logging
public class PoemController {
	
	@Autowired
	PoemService poemService;
	@Autowired
	ThemeService themeService;
	@Autowired
	MemberService memberService;
	@Autowired
	ResponseService responseService;
	
	
	
	@GetMapping("/content")
	public String content(@ModelAttribute("content") Content content,Model model, HttpSession session) {

	
		Long id = content.getId();
		Poem poem = new Poem();
		poem = poemService.findById(id);
		Member member = (Member)session.getAttribute("member");

		if(member.getId() != poem.getMemberId()) {
			//조회수 1 올리기? 아 본인꺼는 올리지 말자.
			poemService.hitPlus(poem.getId());
			System.out.println("***----조회수 1 올라감!!----");
		}
		model.addAttribute("poem", poem);
		model.addAttribute("response", new Response());
		
		//댓글 리스트 가져오기
		List<Response> responseList =  responseService.findByPoemId(poem.getId());
		model.addAttribute("responseList", responseList);
		
		return "poem/content";
		
	}

	
	@GetMapping("/themecontent")
	public String themecontent(@ModelAttribute("theme") Theme theme, Model model, HttpSession session) {
		System.out.println("=================");
		System.out.println("theme.id : " + theme.getId());
		String themename = themeService.findByThemeId(theme.getId());
		model.addAttribute("themename", themename);
		List<Poem> poemlist = poemService.findByThemeId(theme.getId());
		System.out.println(poemlist);
		System.out.println(poemlist.size());
		model.addAttribute("poemlist", poemlist);
		model.addAttribute("content", new Content());
	
		return "poem/themecontent";
		
	}
	
	
	@GetMapping("/mywork")
	public String mywork(Model model, HttpSession session) {
		
		Member member = (Member)session.getAttribute("member");
		List<Poem> poemlist = poemService.findByMemberId(member.getId());
		
		
		List<Response> responselist = responseService.findByMemberId(member.getId());
		model.addAttribute("responselist",responselist);
		model.addAttribute("poemlist", poemlist);
		model.addAttribute("content", new Content());
		model.addAttribute("response", new Response());
		return "poem/mywork";
		
	}
	
	
	@GetMapping("/write")
	public String writeForm(Model model) {
		PoemWriteForm form = new PoemWriteForm();
		model.addAttribute("poemWriteForm", form);
		//모든 주제 정보를 담아 전송
		List<Theme> themelist = poemService.themelist();
		model.addAttribute("themelist", themelist);
		
		return "poem/writeForm";
		}
	
	@PostMapping("/write")
	public String write(@Validated @ModelAttribute("poemWriteForm") PoemWriteForm form, 
			BindingResult bindingResult, Model model, HttpSession session) {

		Long themeId = themeService.findByThemename(form.getTheme());
		Member member = (Member) session.getAttribute("member");
		Long memberId = member.getId();
		Poem poem = new Poem();
		poem.setMemberId(memberId);
		poem.setMemberNickname(form.getMemberNickname());
		poem.setThemeId(themeId);
		poem.setTitle(form.getTitle());
		poem.setContent(form.getContent());
		poemService.save(poem);
		
		return "member/mypage";
	
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
		}
		
		return "redirect:/member/mypage";
		}
	
	
	
	
	
	
	
	

	
	
}
