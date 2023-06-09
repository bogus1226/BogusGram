package com.bogus.bogusgram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bogus.bogusgram.common.FileManagerService;
import com.bogus.bogusgram.post.comment.bo.CommentBO;
import com.bogus.bogusgram.post.comment.model.Comment;
import com.bogus.bogusgram.post.dao.PostDAO;
import com.bogus.bogusgram.post.like.bo.LikeBO;
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
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	public int postCreate(int userId, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public List<PostDetail> getPost(Integer userId) {
		
		// 컨트롤러에서 원하는 (jsp에서 사용할) 데이터 형태를 만들어 준다.
		List<Post> postList = postDAO.selectPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			User user = userBO.getUserById(post.getUserId());
			
			PostDetail postDetail = new PostDetail();
			int likeCount = likeBO.getListCount(post.getId());
			boolean isLike = false;
			if(userId != null) {
				isLike = likeBO.isDuplicateLike(userId, post.getId());	
			}
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			for(Comment comment:commentList) {
				User userNickName = userBO.getUserById(comment.getUserId()); 
				comment.setNick_name(userNickName);
			}
			
			postDetail.setId(post.getId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setNick_name(user.getNick_name());
			postDetail.setLikeCount(likeCount);
			if(userId != null) {
				postDetail.setLike(isLike);
			}
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	
	public int postHide(int postId) {
		
		return postDAO.updatePostHide(postId);
	}
	
	public boolean postDelte(int postId, int userId) {
		
		Post post = postDAO.selectPostInfo(postId, userId);
		
		if(post != null) {
			
			FileManagerService.removeFile(post.getImagePath());
			
			int postCount = postDAO.deletePost(postId, userId);
			
			commentBO.deletePostAllComment(postId);
			
			likeBO.deletePostAllLike(postId);
			
			return postCount != 0;
		}
		
		return false;
		
	}
	
	public Post getPostInfo(int postId, int userId) {
		
		return postDAO.selectPostInfo(postId, userId);
	}
	
	public int postUpdate(int userId, int postId, String content, MultipartFile file) {
		
		Post post = postDAO.selectPostInfo(postId, userId);
		
		if(post != null) {
			
			FileManagerService.removeFile(post.getImagePath());
			
			String imagePath = FileManagerService.saveFile(userId, file);
			
			return postDAO.updatePost(postId, content, imagePath);	
		}
		
		return 0;
	}
	
	public List<PostDetail> getPostByUserId(int userId, Integer sessionUserId) {
		
		// 컨트롤러에서 원하는 (jsp에서 사용할) 데이터 형태를 만들어 준다.
		List<Post> postList = postDAO.selectPostByUserId(userId);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			User user = userBO.getUserById(post.getUserId());
			
			PostDetail postDetail = new PostDetail();
			int likeCount = likeBO.getListCount(post.getId());
			boolean isLike = false;
			if(sessionUserId != null) {
				isLike = likeBO.isDuplicateLike(sessionUserId, post.getId());	
			}
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			for(Comment comment:commentList) {
				User userNickName = userBO.getUserById(comment.getUserId()); 
				comment.setNick_name(userNickName);
			}
			
			postDetail.setId(post.getId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setNick_name(user.getNick_name());
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(isLike);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	public List<PostDetail> getPostHideByUserId(int userId) {
		
		// 컨트롤러에서 원하는 (jsp에서 사용할) 데이터 형태를 만들어 준다.
		List<Post> postList = postDAO.selectPostHideByUserId(userId);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			User user = userBO.getUserById(post.getUserId());
			
			PostDetail postDetail = new PostDetail();
			int likeCount = likeBO.getListCount(post.getId());
			boolean isLike = false;
			isLike = likeBO.isDuplicateLike(userId, post.getId());	
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			for(Comment comment:commentList) {
				User userNickName = userBO.getUserById(comment.getUserId()); 
				comment.setNick_name(userNickName);
			}
			
			postDetail.setId(post.getId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setNick_name(user.getNick_name());
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(isLike);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	public int countPostList(int userId) {
		return postDAO.selectPostCount(userId);
	}
	
	public int countPostHideList(int userId) {
		return postDAO.selectHidePostCount(userId);
	}
	
	public int updateHideInfo(int postId) {
		return postDAO.updateHideInfo(postId);
	}
	
	
}
