package com.example.demo.response;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @Builder
@NoArgsConstructor
@AllArgsConstructor
public class Response {
	
	private Long id;
	private Long memberId;
	private Long poemId;
	private String content;
	private Date regDate;
	
	//멤버
	private String memberNickname;
	private String poemTitle;
	

}
