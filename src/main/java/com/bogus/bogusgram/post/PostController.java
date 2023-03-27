package com.bogus.bogusgram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bogus.bogusgram.post.bo.PostBO;
import com.bogus.bogusgram.post.model.Post;
import com.bogus.bogusgram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/mainpage/view")
	public String mainPage(Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getPost(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/mainpage";
	}
	
	@GetMapping("/update/view")
	public String postUpdate(@RequestParam("postId") int postId
			, Model model) {
		
		Post post = postBO.getPostInfo(postId);
		model.addAttribute("post", post);
		
		return "post/update";
	}
	
	
}
