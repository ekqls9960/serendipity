package com.example.demo.web.login.form;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class FindEmailForm {

	@NotBlank
	private String nickname;
	@NotBlank
	private String phoneNum;
	
}
