package com.example.demo.web.poem.service;

import java.util.List;

import com.example.demo.domain.poem.Poem;
import com.example.demo.domain.theme.Theme;

public interface PoemService {
	
	List<Theme> themelist();
	void save(Poem poem);

	

}
