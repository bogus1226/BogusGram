package com.bogus.bogusgram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/mainpage/view")
	public String mainPage(				
			@RequestParam(value = "id", defaultValue = "0") int id) {
		
		return "post/mainpage";
	}
}
