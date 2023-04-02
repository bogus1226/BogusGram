package com.bogus.bogusgram.profile.follow.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FollowDAO {

	public int insertFollow(
			@Param("userId") int userId
			, @Param("followUserId") int followUserId);
	
	public int deleteFollow(
			@Param("userId") int userId
			, @Param("followUserId") int followUserId);
	
	public int isDuplicateFollow(
			@Param("userId") int userId
			, @Param("followUserId") int followUserId);
}
