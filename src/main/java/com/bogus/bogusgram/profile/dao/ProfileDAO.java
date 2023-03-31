package com.bogus.bogusgram.profile.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileDAO {

	public int selectFallowingCount(@Param("userId") int userId);
	
	public int selectFallowerCount(@Param("userId") int userId);
}
