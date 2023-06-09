package com.bogus.bogusgram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectCountlike(
			@Param("postId") int postId);
	
	public int deleteLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectCountIsDuplicateLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int deletePostAllLike(@Param("postId") int postId);
}
