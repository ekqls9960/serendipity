package com.example.demo.domain.Member.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.domain.Member.Member;

@Mapper
public interface MemberMapper {

	@Insert("insert into member(id, email, pwd, nickname, addr, phoneNum, emailAuthCode, isEmailAuth)"
			+ "values(member_seq.nextval, #{email},  #{pwd},  #{nickname},  #{addr},  #{phoneNum},  #{emailAuthCode,jdbcType=VARCHAR},  #{isEmailAuth})")
	void save(Member member);
	
}
