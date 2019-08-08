package com.delicious.entity;

import java.sql.Timestamp;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String email;
	private String phone;
	private String content;
	private Timestamp publishDate;
	private Integer isRead;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(String userName, String email, String phone, String content,
			Timestamp publishDate) {
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.content = content;
		this.publishDate = publishDate;
	}

	/** full constructor */
	public Message(String userName, String email, String phone, String content,
			Timestamp publishDate, Integer isRead) {
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.content = content;
		this.publishDate = publishDate;
		this.isRead = isRead;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Timestamp publishDate) {
		this.publishDate = publishDate;
	}

	public Integer getIsRead() {
		return this.isRead;
	}

	public void setIsRead(Integer isRead) {
		this.isRead = isRead;
	}

}