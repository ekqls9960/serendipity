package com.example.demo.domain.poem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.domain.poem.Poem;
import com.example.demo.domain.theme.Theme;

@Mapper
public interface PoemMapper {
	
	
	
	@Select("select themename from theme")
	List<Theme> selectAll();
	
	@Insert("insert into poem(id, memberId, themeId, title, content, memberNickname)"
			+ "values(poem_seq.nextval, #{poem.memberId}, #{poem.themeId}, #{poem.title}, #{poem.content}, #{poem.memberNickname} )")
	void save(@Param("poem")Poem poem);


	@Select("select * from poem where memberId=#{memberId}")
	List<Poem> selectByMemberId(Long memberId);

	
	@Select("select * from poem where id=#{id}")
	Poem selectById(Long id);
	
	
	@Select("select * from poem where themeId=#{themeId}")
	List<Poem> selectByThemeId(Long themeId);
	
	@Update("update Poem set hit = hit + 1 where id=#{id} ")
	void updateHit(Long id);
	
	
	@Update("update Poem set commentcount = commentcount + 1 where id=#{id} ")
	void updateCommentcount(Long id);
	
	@Update("update Poem set commentcount = commentcount -1 where id=#{id} ")
	void updateCommentcountMinus(Long id);
	
}