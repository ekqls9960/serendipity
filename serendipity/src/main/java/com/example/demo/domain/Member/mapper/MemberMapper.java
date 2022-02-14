package com.example.demo.domain.Member.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.domain.Member.Member;

@Mapper
public interface MemberMapper {

	@Insert("insert into member(id, email, pwd, nickname, addr, phoneNum, emailAuthCode, isEmailAuth)"
			+ "values(member_seq.nextval, #{email},  #{pwd},  #{nickname},  #{addr},  #{phoneNum},  #{emailAuthCode,jdbcType=VARCHAR},  #{isEmailAuth})")
	void save(Member member);
	
	
	@Select("select * from member where id=#{id}")
	Member selectById(Long id);
	
	@Select("select * from member where email=#{email}")
	Member selectByEmail(String email);
	
	@Select("select * from member where phoneNum=#{phoneNum}")
	Member selectByPhoneNum(String phoneNum);
	
	@Select("select * from member where nickname=#{nickname}")
	Member selectByNickname(String nickname);
	
	@Update("update member set IsEmailAuth=#{member.isEmailAuth} where email=#{email}")
	void updateIsEmailAuth(@Param("email")String email, @Param("member")Member member );
}
