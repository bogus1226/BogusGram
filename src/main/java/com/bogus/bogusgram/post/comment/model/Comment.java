package com.bogus.bogusgram.post.comment.model;

import java.util.Date;
import java.util.List;

import com.bogus.bogusgram.user.model.User;

public class Comment {

	private int id;
	private int postId;
	private int userId;
	private String comment;
	private Date createdAt;
	private Date updatedAt;
	private User nick_name;
	

	public User getNick_name() {
		return nick_name;
	}
	public void setNick_name(User nick_name) {
		this.nick_name = nick_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
}
