package com.example.demo.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MainController {
	

	@GetMapping("/")
	public String main(Model model,HttpServletRequest request) {
		
		return "main";
	}
	
	@GetMapping("/2")
	public String main2(Model model,HttpServletRequest request) {
		
		return "main2";
	}
}
