package com.example.demo.interceptor;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;



@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

		@Value("${resources.notload.list}")
		private List<String>notLoadList;
	
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(new AuthLoginInterceptor())
					.addPathPatterns("/**")
					.excludePathPatterns("/","/myapp/**", "/member/join","/member/emailAuthCallBack",
							"/login/**",  "/css/**","/assets/**",
							"/js/**", "/error/**");



			
		
		}
		
		
}
