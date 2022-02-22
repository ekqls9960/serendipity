package com.example.demo.web.poem.form;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


@Getter @Setter
public class PoemWriteForm {
	
	private String theme;
	private String title;
	private String content;
	private String memberNickname;

}
