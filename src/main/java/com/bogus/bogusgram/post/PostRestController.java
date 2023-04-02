package com.bogus.bogusgram.post;

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

import com.bogus.bogusgram.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> postCreate(
			@RequestParam("content") String content
			,@RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session) {
		
		Map<String, String> resultMap = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.postCreate(userId, content, file);
		
		if(count != 0) {
			resultMap.put("result", "success"); 	
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	@GetMapping("/hide")
	public Map<String, String> postHide(@RequestParam("postId") int postId) {
		
		int count = postBO.postHide(postId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@GetMapping("/delete")
	public Map<String, Boolean> postDelete(
			@RequestParam("postId") int postId
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("result", postBO.postDelte(postId, userId));
	
		return resultMap;
	}
	
	@PostMapping("/update")
	public Map<String, String> postUpdate(
			@RequestParam("postId") int postId
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.postUpdate(userId, postId, content, file);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	

	
	
}
