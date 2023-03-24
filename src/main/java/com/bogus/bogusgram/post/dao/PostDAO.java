package com.bogus.bogusgram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusgram.post.model.Post;
import com.bogus.bogusgram.user.model.User;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectPost(); 
	
	public int insertLike(@Param("postId") int postId, @Param("userId") int userId);
	
	public int selectLike(@Param("postId") int postId);
	
// 	닉네임 가져오기 실패작품들
//	public User	selectUser(@Param("userId") int userId);	
//	public List<User> selectUser2();
	
}
