package com.bogus.bogusgram.profile;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/profile")
public class ProfileRestController {
	
	@GetMapping("/update")
	public Map<String, String> profileUpdate(
			@RequestParam("name") String name
			, @RequestParam("nickName") String nickName
			, @RequestParam("profileImg") String profileImg) {
		
	}
}
