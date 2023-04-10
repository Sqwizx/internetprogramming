package com.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "stress")
public class Post {
	@Id
	@Column(name = "id")
	int id;
	@Column(name = "author")
	String author;
	@Column(name = "title")
	String title;
	@Column(name = "content")
	String content;
	@Column(name = "viewCount")
	int viewCount;
	@Column(name = "lastPost")
	Timestamp lastPost;
	@Column(name = "userID")
	int userID;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Timestamp getLastPost() {
		return lastPost;
	}

	public void setLastPost(Timestamp lastPost) {
		this.lastPost = lastPost;
	}

}
