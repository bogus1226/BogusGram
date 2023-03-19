package com.bogus.bogusgram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusgram.user.bo.UserBO;

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
	public Map<String, Boolean> login(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password) {
		
		Map<String, Boolean> resultMap = new HashMap<>();
		resultMap.put("result", userBO.loginCheck(loginId, password));
		resultMap.put("idResult", userBO.isDuplicate(loginId));
		
		return resultMap;
	}
	
}
