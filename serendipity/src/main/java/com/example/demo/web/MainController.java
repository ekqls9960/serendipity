package com.example.demo.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.domain.theme.Theme;
import com.example.demo.web.theme.service.ThemeService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MainController {
	@Autowired
	ThemeService themeService;

	@GetMapping("/")
	public String main(Model model,HttpServletRequest request) {
		
		List<Theme> list = themeService.findAll();
		model.addAttribute("list", list);
		model.addAttribute("theme", new Theme());

		
		
		return "main";
	}
	
	@GetMapping("/2")
	public String main2(Model model,HttpServletRequest request) {
		
		return "main2";
	}
}
