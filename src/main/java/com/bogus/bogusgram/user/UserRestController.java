package com.bogus.bogusgram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusgram.user.bo.UserBO;
import com.bogus.bogusgram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/signinup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("name") String name
			, @RequestParam("nickname") String nickname
			, @RequestParam("password") String password) {
		
		int count = userBO.addUser(loginId, name, nickname, password);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/isDuplicate")
	public Map<String, Boolean> isDuplicate(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		resultMap.put("is_duplicate", userBO.isDuplicate(loginId));
		
		return resultMap;
	}
	
	@PostMapping("/signin")
	public Map<String, Object> login(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		
		User user = userBO.loginCheck(loginId, password);
		Map<String, Object> resultMap = new HashMap<>();
		if(user != null) {
			resultMap.put("result", "success");
			
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
		} else {
			resultMap.put("result", "fail");
		}
			resultMap.put("idResult", userBO.isDuplicate(loginId));
		
		return resultMap;
	}
	
}
