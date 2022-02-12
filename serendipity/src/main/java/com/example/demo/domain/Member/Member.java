package com.example.demo.domain.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
		private long id;
	    private String email;
	    private String nickname;
	    private String pwd;
	    private String phoneNum;
	    private String addr;
	    private String emailAuthCode; 
	    private EmailAuth isEmailAuth;  

}
