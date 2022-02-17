package com.example.demo.domain.poem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.poem.Poem;
import com.example.demo.domain.theme.Theme;

@Mapper
public interface PoemMapper {
	
	
	
	@Select("select themename from theme")
	List<Theme> selectAll();
	
	@Insert("insert into poem(id, memberId, themeId, title, content)"
			+ "values(poem_seq.nextval, #{poem.memberId}, #{poem.themeId}, #{poem.title}, #{poem.content} )")
	void save(@Param("poem")Poem poem);


}
