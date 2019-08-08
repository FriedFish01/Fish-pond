package com.delicious.entity;

import java.util.Date;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class News implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String content;
	private Date publishDate;
	private Integer userId;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** minimal constructor */
	public News(String title, String content) {
		this.title = title;
		this.content = content;
	}

	/** full constructor */
	public News(String title, String content, Date publishDate, Integer userId) {
		this.title = title;
		this.content = content;
		this.publishDate = publishDate;
		this.userId = userId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}