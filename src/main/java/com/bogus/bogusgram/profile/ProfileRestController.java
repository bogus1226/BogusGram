package com.bogus.bogusgram.profile;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bogus.bogusgram.profile.bo.ProfileBO;

@RestController
@RequestMapping("/profile")
public class ProfileRestController {
	
	@Autowired
	private ProfileBO profileBO;
	
	@PostMapping("/update")
	public Map<String, String> profileUpdate(
			@RequestParam("name") String name
			, @RequestParam("nickName") String nickName
			, @RequestParam(value="profileImg", required=false) MultipartFile file
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = profileBO.updateUserInfo(userId, name, nickName, file);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/cancle/hide")
	public Map<String, String> updateHideInfo(
			@RequestParam("postId") int postId) {
		
		int count = profileBO.updateHideInfo(postId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
