package com.example.demo.web.poem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.poem.Poem;
import com.example.demo.domain.poem.mapper.PoemMapper;
import com.example.demo.domain.theme.Theme;
import com.example.demo.response.Response;
import com.example.demo.response.mapper.ResponseMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Service
@RequiredArgsConstructor
@Slf4j
public class PoemServiceImpl implements PoemService{

	
	@Autowired
	PoemMapper poemMapper;
	@Autowired
	ResponseMapper responseMapper;
	
	
	
	@Override
	public List<Theme> themelist() {
		return poemMapper.selectAll();
	}
	@Override
	public void save(Poem poem) {

		poemMapper.save(poem);
	}
	@Override
	public List<Poem> findByMemberId(Long memberId) {
		
		return poemMapper.selectByMemberId(memberId);
	}
	@Override
	public Poem findById(Long id) {
		return poemMapper.selectById(id);
	}
	@Override
	public List<Poem> findByThemeId(Long themeId) {
		return poemMapper.selectByThemeId(themeId);
	}
	@Override
	public void hitPlus(Long id) {
		poemMapper.updateHit(id);
		
	}
	@Override
	public void commentCountPlus(Long id) {
		poemMapper.updateCommentcount(id);
	}
	@Override
	public void commentCountMinus(Long id) {
		poemMapper.updateCommentcountMinus(id);
	}


}
