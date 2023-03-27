package com.bogus.bogusgram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusgram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	public int addLike(int userId, int postId) {
		
		return likeDAO.insertLike(userId, postId);
	}
	
	public int getListCount(int postId) {
		
		return likeDAO.selectCountlike(postId);
	}
	
	public int deleteLike(int userId, int postId) {
		
		return likeDAO.deleteLike(userId, postId);
	}
	
	public Boolean isDuplicateLike(int userId, int postId) {
		
		int count = likeDAO.selectCountIsDuplicateLike(userId, postId);
		
		return count != 0;
	}
}
