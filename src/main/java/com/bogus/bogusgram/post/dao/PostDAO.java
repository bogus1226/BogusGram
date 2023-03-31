package com.bogus.bogusgram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusgram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectPost(); 
	
	public int selectIsDuplicateLike(@Param("postId") int postId, @Param("userId") int userId);
	
	public int updatePostHide(@Param("postId") int postId);
	
	public int deletePost(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public Post selectPostInfo(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int updatePost(
			@Param("postId") int postId 
			,@Param("content") String content
			,@Param("file") String file);
	
	public List<Post> selectPostByUserId(
			@Param("userId") int userId); 
	
	public int selectPostCount(
			@Param("userId") int userId);
}
