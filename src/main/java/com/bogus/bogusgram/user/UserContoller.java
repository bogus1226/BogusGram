package com.bogus.bogusgram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserContoller {
	
	@GetMapping("/signup/view")
	public String signupInput() {
		
		return "user/signup";
	}
	
	@GetMapping("/signin/view")
	public String signinInput() {
		
		return "user/signin";
	}
	
	@GetMapping("signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
        
        session.removeAttribute("userId");
        session.removeAttribute("userName");
        
        return "redirect:/post/mainpage/view"; 
	}
}
