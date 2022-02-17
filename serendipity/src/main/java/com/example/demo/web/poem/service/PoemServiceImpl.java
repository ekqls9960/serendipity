package com.example.demo.web.poem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.poem.Poem;
import com.example.demo.domain.poem.mapper.PoemMapper;
import com.example.demo.domain.theme.Theme;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@RequiredArgsConstructor
@Slf4j
public class PoemServiceImpl implements PoemService{

	
	@Autowired
	PoemMapper poemMapper;
	@Override
	public List<Theme> themelist() {
		
		return poemMapper.selectAll();
	}
	@Override
	public void save(Poem poem) {

		poemMapper.save(poem);
	}

}
