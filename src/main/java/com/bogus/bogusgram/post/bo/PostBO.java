package com.bogus.bogusgram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bogus.bogusgram.common.FileManagerService;
import com.bogus.bogusgram.post.dao.PostDAO;
import com.bogus.bogusgram.post.model.Post;
import com.bogus.bogusgram.post.model.PostDetail;
import com.bogus.bogusgram.post.model.PostLike;
import com.bogus.bogusgram.user.bo.UserBO;
import com.bogus.bogusgram.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int postCreate(int userId, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<PostDetail> getPost() {
		
		// 컨트롤러에서 원하는 (jsp에서 사용할) 데이터 형태를 만들어 준다.
		List<Post> postList = postDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			User user = userBO.getUserById(post.getUserId());
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setId(post.getId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setNick_name(user.getNick_name());
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	public int getLike(int postId,int userId) {
		
		return postDAO.insertLike(postId, userId);
	}
	
	
//  닉네임 가져오기 실패 작품들...	
//	public User getUser() {
//		List<Post> list= postDAO.selectPost();
//		int userId = list.get(1).getUserId();
//		
//		return postDAO.selectUser(userId);
//	}
//	
//	public User getUser(int userId) {
//		return postDAO.selectUser(userId);
//	}
//	
//	public List<User> getUser2() {
//		return postDAO.selectUser2();
//	}
	
	
}
