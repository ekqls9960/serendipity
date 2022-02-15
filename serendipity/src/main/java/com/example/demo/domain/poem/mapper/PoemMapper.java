package com.example.demo.domain.poem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.theme.Theme;

@Mapper
public interface PoemMapper {
	
	
	
	@Select("select themename from theme")
	List<Theme> selectAll();
	
	


}
