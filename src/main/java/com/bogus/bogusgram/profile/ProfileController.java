package com.bogus.bogusgram.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@GetMapping("/view")
	public String profile() {
		
		return "profile/profile";
	}
}
