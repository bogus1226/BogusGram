package com.bogus.bogusgram.profile.follow;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusgram.profile.follow.bo.FollowBO;

@RestController
@RequestMapping("/profile")
public class FollowRestController {
	
	@Autowired
	private FollowBO followBO;

	@GetMapping("/follow")
	public Map<String, String> follow(
			@RequestParam("userId") int userId
			, @RequestParam("followUserId") int followUserId) {
		
		int count = followBO.follow(userId, followUserId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/unfollow")
	public Map<String, String> unFollow(
			@RequestParam("userId") int userId
			, @RequestParam("followUserId") int followUserId) {
		
		int count = followBO.unFollow(userId, followUserId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
