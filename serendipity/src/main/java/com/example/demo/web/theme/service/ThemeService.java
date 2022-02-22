package com.example.demo.web.theme.service;

import java.util.List;

import com.example.demo.domain.theme.Theme;

public interface ThemeService {
	
	List<Theme> findAll();
	Long findByThemename(String themename);
	String findByThemeId(Long id);
}
