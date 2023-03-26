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
	
	public List<PostDetail> getPost(int userId) {
		
		// 컨트롤러에서 원하는 (jsp에서 사용할) 데이터 형태를 만들어 준다.
		List<Post> postList = postDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			User user = userBO.getUserById(post.getUserId());
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setLikeCheck(postDAO.selectIsDuplicateLike(post.getId(), userId));
			postDetail.setLike(postDAO.selectLike(post.getId()));
			postDetail.setId(post.getId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setNick_name(user.getNick_name());
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
//  게시물의 댓글 화면에 보이기 진행중
//	public List<PostComment> getComment() {
//		
//		List<Post> postList = postDAO.selectPost();
//		
//		List<PostComment> postCommentList = new ArrayList<>();
//		
//		for(Post post:postList) {
//			
//			User user = userBO.getUserById(post.getUserId());
//			
//			postCommentList.addAll( postDAO.selectComment(post.getId()));
//			
//			PostComment postComment = new PostComment();
//			
//			postComment.setNick_name(user.getNick_name());
//			
//			
//		}
//		
//		return postCommentList;
//	}
	
	public int getLike(int postId,int userId) {
		
		return postDAO.insertLike(postId, userId);
	}
	
	public Boolean isDuplicateLike(int postId,int userId) {
		
		int count = postDAO.selectIsDuplicateLike(postId, userId);
		
		return count != 0;
	}
	
	public int unlike(int postId,int userId) {
		
		return postDAO.deleteUnlike(postId, userId);
	}
	
	public int postHide(int postId) {
		
		return postDAO.updatePostHide(postId);
	}
	
	public int postDelte(int postId) {
		
		return postDAO.deletePost(postId);
	}
	
	public Post getPostInfo(int postId) {
		
		return postDAO.selectPostInfo(postId);
	}
	
	public int postUpdate(int userId, int postId, String content, MultipartFile file) {
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.updatePost(postId, content, imagePath);
	}
	
	public int commentAdd(int userId, int postId, String Commnet) {
		return postDAO.insertComment(userId, postId, Commnet);
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
