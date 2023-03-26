package com.bogus.bogusgram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusgram.post.model.Post;
import com.bogus.bogusgram.post.model.PostDetail;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectPost(); 
	
	public int insertLike(@Param("postId") int postId, @Param("userId") int userId);
	
	public int selectLike(@Param("postId") int postId);
	
	public int selectIsDuplicateLike(@Param("postId") int postId, @Param("userId") int userId);
	
	public int deleteUnlike(@Param("postId") int postId, @Param("userId") int userId);
	
	public int updatePostHide(@Param("postId") int postId);
	
	public int deletePost(@Param("postId") int postId);
	
	public Post selectPostInfo(@Param("postId") int postId);
	
	public int updatePost(
			@Param("postId") int postId 
			,@Param("content") String content
			,@Param("file") String file);
	
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("comment") String comment);
	
//  게시물의 댓글 화면에 보이기 진행중	
//	public List<PostDetail> selectComment(@Param("postId") int postId);
	
// 	닉네임 가져오기 실패작품들
//	public User	selectUser(@Param("userId") int userId);	
//	public List<User> selectUser2();
	
}
