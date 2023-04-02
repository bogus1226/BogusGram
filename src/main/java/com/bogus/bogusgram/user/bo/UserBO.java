package com.bogus.bogusgram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bogus.bogusgram.common.EncryptService;
import com.bogus.bogusgram.common.FileManagerService;
import com.bogus.bogusgram.user.dao.UserDAO;
import com.bogus.bogusgram.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String name
			, String nickname
			, String password) {
		
		String encryptPassword = EncryptService.md5(password);
		
		return userDAO.insertUser(loginId, name, nickname, encryptPassword);
	}
	
	public boolean isDuplicate(String loginId) {
		
		int count = userDAO.selectCountIsDuplicate(loginId);
		
		return count != 0;
	}
	
	public User loginCheck(String loginId, String password) {
		
		String encryptPassword = EncryptService.md5(password);
		
		return userDAO.selcetCountLoginCheck(loginId, encryptPassword);
		
	}
	
	public User getUserById(int userId) {
		return userDAO.selectUserById(userId);
	}
	
	public int updateUserInfo(int userId, String name, String nickName, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return userDAO.updateUserInfo(userId, name, nickName, imagePath);
	}
	
}
