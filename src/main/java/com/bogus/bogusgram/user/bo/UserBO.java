package com.bogus.bogusgram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		return userDAO.insertUser(loginId, name, nickname, password);
	}
}
