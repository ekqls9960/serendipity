package com.example.demo.web.response.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.response.Response;
import com.example.demo.web.poem.service.PoemService;
import com.example.demo.web.response.service.ResponseService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/response")
@Slf4j //logging
public class ResponseController {
	
	@Autowired
	ResponseService responseService;

	@Autowired
	PoemService poemService;
	
	

	@PostMapping("/add")
	public String responseAdd(@Validated @ModelAttribute("response")Response response, 
			BindingResult bindingResult, Model model, HttpSession session) {
		
		
		if(bindingResult.hasErrors()){
            log.info("errors={}", bindingResult);
            return "member/editForm";
        }
		
		Response res = new Response();
		res.setContent(response.getContent());
		res.setMemberId(response.getMemberId());
		res.setPoemId(response.getPoemId());
		res.setMemberNickname(response.getMemberNickname());
		res.setPoemTitle(response.getPoemTitle());
	
		//db에 댓글 추가
		responseService.add(res);
		//해당 시의 comment 개수 업뎃
		poemService.commentCountPlus(response.getPoemId());
		
		
		
		return "redirect:/poem/content" + "?id=" + response.getPoemId();
		}
	
	
	
	
	@GetMapping("/delete")
	public String responseDelete(@Validated @ModelAttribute("response")Response response, 
		BindingResult bindingResult, Model model, HttpSession session) {

		
		//댓글삭제
		responseService.delete(response.getId());
		
		
		//시 댓글수도 줄어들게.ㄴ
		poemService.commentCountMinus(response.getPoemId());
		
		return "redirect:/poem/content" + "?id=" + response.getPoemId();
	}
	
	
	
}
