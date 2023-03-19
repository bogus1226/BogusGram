package com.bogus.bogusgram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bogus.bogusgram.common.EncryptService;
import com.bogus.bogusgram.user.dao.UserDAO;

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
	
	public boolean loginCheck(String loginId, String password) {
		
		String encryptPassword = EncryptService.md5(password);
		
		int count = userDAO.selcetCountLoginCheck(loginId, encryptPassword);
		
		return count != 0;
	}
}
