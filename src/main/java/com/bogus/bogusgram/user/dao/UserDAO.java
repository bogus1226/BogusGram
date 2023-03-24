package com.bogus.bogusgram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bogus.bogusgram.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("name") String name
			, @Param("nickname") String nickname
			, @Param("password") String password);
	
	public int selectCountIsDuplicate(@Param("loginId") String loginId);
	
	public User selcetCountLoginCheck(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	public User selectUserById(@Param("id") int id);
}
