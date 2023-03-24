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
import com.bogus.bogusgram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/mainpage/view")
	public String mainPage(Model model) {
		
		List<PostDetail> postList = postBO.getPost();
		
		model.addAttribute("postList", postList);
		
// 		게시물에 닉네임 구현하기위해 생각헀던 실패 자료들
//		List<User> userList = postBO.getUser2();
//		
//		Map<Object, Object> maps = new HashMap<>();
//		maps.put(postList, userList);
//		
//		model.addAttribute("maps", maps);
//
//		model.addAttribute("user", postBO.getUser(1).getNick_name());
//		
//		List<Map<List<Post>, User>> list = new ArrayList<>();
//		Map<List<Post>, User> map = new HashMap<>();
//		map.put(postList, postBO.getUser(0));
//		list.add(map);
		
		return "post/mainpage";
	}
	
	
	
}
