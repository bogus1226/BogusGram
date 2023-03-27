package com.bogus.bogusgram.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusgram.post.comment.dao.CommentDAO;
import com.bogus.bogusgram.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int commentAdd(int userId, int postId, String Commnet) {
		return commentDAO.insertComment(userId, postId, Commnet);
	}
	
	public List<Comment> getCommentList(int postId) {
		
		return commentDAO.selectCommentList(postId);
	}

	public int deletePostAllComment(int postId) {
		return commentDAO.deletePostAllComment(postId);
	}
	
}
