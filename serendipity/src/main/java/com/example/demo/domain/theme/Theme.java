package com.example.demo.domain.theme;

import com.example.demo.domain.Member.EmailAuth;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Theme {

	private long id;
	private String themename;
	private String imagepath;
}
