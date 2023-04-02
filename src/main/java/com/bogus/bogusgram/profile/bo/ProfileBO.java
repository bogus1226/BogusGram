package com.bogus.bogusgram.profile.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bogus.bogusgram.common.FileManagerService;
import com.bogus.bogusgram.post.bo.PostBO;
import com.bogus.bogusgram.post.model.PostDetail;
import com.bogus.bogusgram.profile.dao.ProfileDAO;
import com.bogus.bogusgram.user.bo.UserBO;
import com.bogus.bogusgram.user.model.User;

@Service
public class ProfileBO {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private ProfileDAO profileDAO;
	
	@Autowired
	private UserBO userBO;
	
	public List<PostDetail> getPostList(int userId, Integer sessionUserId) {
		
		return postBO.getPostByUserId(userId, sessionUserId);
	}
	
	public List<PostDetail> getPostHideList(int userId) {
		
		return postBO.getPostHideByUserId(userId);
	}
	
	
	public int getPostListCount(int userId) {
		
		return postBO.countPostList(userId);
	}
	
	public int getFallowingCount(int userId) {
		
		return profileDAO.selectFallowingCount(userId);
	}
	
	public int getFallowerCount(int userId) {
		
		return profileDAO.selectFallowerCount(userId);
	}
	
	public int getPostHideListCount(int userId) {
		
		return postBO.countPostHideList(userId);
	}
	
	
	public User getUserInfo(int userId) {
		return userBO.getUserById(userId);	
	}
	
	public int updateUserInfo(int userId, String name, String nickName, MultipartFile file) {
		
		User user = userBO.getUserById(userId);
		
		if(user.getProfile_img() != null) {
			FileManagerService.removeFile(user.getProfile_img());
		}
		
		return userBO.updateUserInfo(userId, name, nickName, file);
	}
	
	public int updateHideInfo(int postId) {
		
		return postBO.updateHideInfo(postId);
	}
}
