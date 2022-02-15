package com.example.demo.web.member.form;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
public class MemberEditForm {
	
	@NotBlank
    private String email;
	@NotBlank
    private String nickname;

    private String pwd;
	
    private String confirmPwd;
	
    private String phoneNum;
	@NotBlank
    private String roadAddr;
	@NotBlank
    private String postCode;
	@NotBlank
    private String detailAddr;


}
