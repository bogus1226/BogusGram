package com.bogus.bogusgram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bogus.bogusgram.common.FileManagerService;
import com.bogus.bogusgram.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		PermissionInterceptor interceptor = new PermissionInterceptor();
		
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**") // 인터셉터를 거쳐서 처리할 페이지의 url 규칙
		.excludePathPatterns("/user/signout", "/static/**", "/images/**", "/post/mainpage/view"); // 인터셉터를 거치지 않을 예외 페이지 url 규칙
		
	}
}
