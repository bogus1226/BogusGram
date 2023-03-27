package com.bogus.bogusgram.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bogus.bogusgram.post.comment.bo.CommentBO;

@RestController
@RequestMapping("/post")
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/comment/add") 
	public Map<String, String> commentAdd(
			@RequestParam("postId") int postId
			, @RequestParam("comment") String comment
			, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = commentBO.commentAdd(userId, postId, comment);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
