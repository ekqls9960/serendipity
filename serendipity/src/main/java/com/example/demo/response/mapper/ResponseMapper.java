package com.example.demo.response.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.demo.response.Response;

@Mapper
public interface ResponseMapper {

	
	
	
	@Insert("insert into response(id, poemId, memberId, content, membernickname, poemTitle) "
			+ "values(response_seq.nextval, #{res.poemId}, #{res.memberId}, #{res.content}, #{res.memberNickname}, #{res.poemTitle})")
	void add(@Param("res") Response res);
	
	
	@Select("select * from response where poemId=#{poemId} order by id asc")
	List<Response> findByPoemId(Long poemId);
	
	@Select("select * from response where memberId=#{memberId} order by id asc")
	List<Response> findByMemberId(Long memberId);

	@Delete("delete from response where id=#{id}")
	void delete(Long id);



}
