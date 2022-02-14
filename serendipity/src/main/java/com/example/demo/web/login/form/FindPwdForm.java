package com.example.demo.web.login.form;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class FindPwdForm {

	@NotBlank
	private String email;
	@NotBlank
	private String phoneNum;
	
}
