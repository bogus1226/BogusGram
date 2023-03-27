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
import com.bogus.bogusgram.post.comment.bo.CommentBO;
import com.bogus.bogusgram.post.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
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
	public Map<String, String> postDelete(@RequestParam("postId") int postId) {
		
		int postCount = postBO.postDelte(postId);
		
		int commentCount = commentBO.deletePostAllComment(postId);
		
		int likeCount = likeBO.deletePostAllLike(postId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		// 게시물 삭제할때 postCount(게시물)은 명확이 존재하고 commentCount(댓글)과 likeCount(좋아요)는 없을수도 있기때문에 이렇게 표현했습니다.
		if(postCount != 0 || (commentCount != 0 || likeCount != 0)) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
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
