package com.example.demo.web.response.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.response.Response;
import com.example.demo.response.mapper.ResponseMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ResponseServiceImpl implements ResponseService {

	
	@Autowired
	ResponseMapper responseMapper;
	
	@Override
	public void add(Response res) {
		System.out.println("res객체2 : " + res);
		responseMapper.add(res);
		
	}
	
	@Override
	public void delete(Long id) {
		responseMapper.delete(id);
	}

	@Override
	public List<Response> findByPoemId(Long poemId) {
		return responseMapper.findByPoemId(poemId);
	}

	@Override
	public List<Response> findByMemberId(Long memberId) {
		
		return responseMapper.findByMemberId(memberId);
	}


}
