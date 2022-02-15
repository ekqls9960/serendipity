package com.example.demo.domain.poem;

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
public class Poem {

	private Long id;
	private Long memberId;
	private Long themeId;
	private String title;
	private String content;
	private Long hit ;
	private Long commentCount;
	private Date date;
	
	
	
}
