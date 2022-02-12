package com.example.demo.web.member.form;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
public class MemberJoinForm {
	
	@NotBlank
    private String email;
	@NotBlank
    private String nickname;
	@NotBlank
    private String pwd;
	@NotBlank
    private String confirmPwd;
	@NotBlank
    private String phoneNum;
	@NotBlank
    private String roadAddr;
	@NotBlank
    private String postCode;
	@NotBlank
    private String detailAddr;


}
