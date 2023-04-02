package com.bogus.bogusgram.profile;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bogus.bogusgram.post.model.PostDetail;
import com.bogus.bogusgram.profile.bo.ProfileBO;
import com.bogus.bogusgram.profile.follow.bo.FollowBO;
import com.bogus.bogusgram.user.model.User;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	private ProfileBO profileBO; 
	
	@Autowired
	private FollowBO followBO;
	
	@GetMapping("/view")
	public String profile(
			@RequestParam("userId") int userId
			, Model model
			, HttpSession session) {
		
		Integer sessionUserId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList =  profileBO.getPostList(userId, sessionUserId);
		List<PostDetail> postHideList =  profileBO.getPostHideList(userId);
		int postCount = profileBO.getPostListCount(userId);
		int postHideCount = profileBO.getPostHideListCount(userId);
		int fallowingCount = profileBO.getFallowingCount(userId);
		int fallowerCount = profileBO.getFallowerCount(userId);
		int isDuplicateFollow = followBO.isDuplicateFollow(sessionUserId, userId);
		User user = profileBO.getUserInfo(userId);
		
		model.addAttribute("postList", postList);
		model.addAttribute("postHideList", postHideList);
		model.addAttribute("postCount", postCount);
		model.addAttribute("postHideCount", postHideCount);
		model.addAttribute("fallowingCount", fallowingCount);
		model.addAttribute("fallowerCount", fallowerCount);
		model.addAttribute("userId", sessionUserId);
		model.addAttribute("profileUserId", userId);
		model.addAttribute("user", user);
		model.addAttribute("isDuplicateFollow", isDuplicateFollow);
		
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
