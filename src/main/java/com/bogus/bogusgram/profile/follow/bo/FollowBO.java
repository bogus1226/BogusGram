package com.bogus.bogusgram.profile.follow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusgram.profile.follow.dao.FollowDAO;

@Service
public class FollowBO {
	
	@Autowired
	private FollowDAO followDAO;

	public int follow(int userId, int followUserId) {
		return followDAO.insertFollow(userId, followUserId);
	}
	
	public int unFollow(int userId, int followUserId) {
		return followDAO.deleteFollow(userId, followUserId);
	}
	
	public int isDuplicateFollow(Integer userId, int followUserId) {
		if(userId != null) {
			return followDAO.isDuplicateFollow(userId, followUserId);
		}
		
		return 0;
	}
}
