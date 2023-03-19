package com.bogus.bogusgram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/mainpage/view")
	public String mainPage() {
		
		return "post/mainpage";
	}
}
