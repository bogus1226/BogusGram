package com.bogus.bogusgram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("name") String name
			, @Param("nickname") String nickname
			, @Param("password") String password);
}
