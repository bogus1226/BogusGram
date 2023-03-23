package com.bogus.bogusgram.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
//		List<User> userList = postBO.getUser2();
//		
//		Map<Object, Object> maps = new HashMap<>();
//		maps.put(postList, userList);
		
//		model.addAttribute("maps", maps);
		model.addAttribute("postList", postList);
		model.addAttribute("user", postBO.getUser(33).getNick_name());
//		
//		List<Map<List<Post>, User>> list = new ArrayList<>();
//		Map<List<Post>, User> map = new HashMap<>();
//		map.put(postList, postBO.getUser(0));
//		list.add(map);
		
		return "post/mainpage";
	}
	
	
	
}
