package com.bogus.bogusgram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bogus.bogusgram.post.bo.PostBO;
import com.bogus.bogusgram.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/mainpage/view")
	public String mainPage(Model model) {
		
		List<Post> postList = postBO.getPost();
		
		model.addAttribute("postList", postList);
		
		return "post/mainpage";
	}
}
