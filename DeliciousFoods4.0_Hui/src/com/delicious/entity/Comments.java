package com.delicious.entity;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class Comments implements java.io.Serializable{
	private int id;
	private String content;
	private Date publishDate;
	private Foods foods;
	private Users users;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	//JSON×¢½â´¦Àí
	@JSON(format="yyyy-MM-dd")
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public Foods getFoods() {
		return foods;
	}
	public void setFoods(Foods foods) {
		this.foods = foods;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	
	
}
