package com.example.demo.web.poem.service;

import java.util.List;

import com.example.demo.domain.poem.Poem;
import com.example.demo.domain.theme.Theme;
import com.example.demo.response.Response;

public interface PoemService {
	
	List<Theme> themelist();
	void save(Poem poem);
	List<Poem>  findByMemberId(Long memberId);
	List<Poem>  findByThemeId(Long memberId);
	Poem findById(Long id);
	void hitPlus(Long id);
	void commentCountPlus(Long id);
	void commentCountMinus(Long id);

}
