package com.example.demo.domain.theme.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.theme.Theme;

@Mapper
public interface ThemeMapper {

	
	
	
	@Select("select * from theme order by id desc")
	List<Theme> selectAll();
	

	@Select("select id from theme where themename=#{themename}")
	Long selectByThemename(String themename);






}
