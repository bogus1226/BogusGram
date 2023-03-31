package com.bogus.bogusgram.profile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bogus.bogusgram.post.model.PostDetail;
import com.bogus.bogusgram.profile.bo.ProfileBO;
import com.bogus.bogusgram.user.model.User;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	private ProfileBO profileBO; 
	
	@GetMapping("/view")
	public String profile(
			@RequestParam("userId") int userId
			, Model model) {
		
		List<PostDetail> postList =  profileBO.getPostList(userId);
		int postCount = profileBO.getPostListCount(userId);
		int fallowingCount = profileBO.getFallowingCount(userId);
		int fallowerCount = profileBO.getFallowerCount(userId);
		
		model.addAttribute("postList", postList);
		model.addAttribute("postCount", postCount);
		model.addAttribute("fallowingCount", fallowingCount);
		model.addAttribute("fallowerCount", fallowerCount);
		model.addAttribute("userId", userId);
		
		return "profile/profile";
	}
	
	@GetMapping("/update/view")
	public String profileUpdate(
			@RequestParam("userId") int userId
			, Model model) {
		
		User userInfo = profileBO.getUserInfo(userId);
		
		model.addAttribute("userInfo", userInfo);
		
		return "profile/profileUpdate";
	}
}
