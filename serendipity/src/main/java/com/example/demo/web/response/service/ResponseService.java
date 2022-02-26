package com.example.demo.web.response.service;

import java.util.List;

import com.example.demo.response.Response;

public interface ResponseService {
	
	
	void add(Response res);
	void delete(Long id);
	List<Response> findByPoemId(Long poemId);
	List<Response> findByMemberId(Long memberId);
}
