package com.bogus.bogusgram.post.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bogus.bogusgram.common.FileManagerService;
import com.bogus.bogusgram.post.dao.PostDAO;
import com.bogus.bogusgram.post.model.Post;
import com.bogus.bogusgram.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int postCreate(int userId, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<Post> getPost() {
		return postDAO.selectPost();
	}
	
//	public User getUser() {
//		List<Post> list= postDAO.selectPost();
//		int userId = list.get(1).getUserId();
//		
//		return postDAO.selectUser(userId);
//	}
	
	public User getUser(int userId) {
		return postDAO.selectUser(userId);
	}
	
//	public List<User> getUser2() {
//		return postDAO.selectUser2();
//	}
	
	
}
