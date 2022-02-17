package com.example.demo.web.theme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.domain.theme.Theme;
import com.example.demo.domain.theme.mapper.ThemeMapper;

import lombok.RequiredArgsConstructor;

@Service 
@RequiredArgsConstructor
public class ThemeServiceImpl implements ThemeService{

	
	private final ThemeMapper themeMapper;
	@Override
	public List<Theme> findAll() {
		
		return themeMapper.selectAll();
	
	}
	@Override
	public Long findByThemename(String themename) {
		
	System.out.println("서비스 들어옴 : long  = " + themeMapper.selectByThemename(themename));
		return 	themeMapper.selectByThemename(themename);
	}

}
