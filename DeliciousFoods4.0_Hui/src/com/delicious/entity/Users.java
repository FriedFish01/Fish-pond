package com.delicious.entity;

import java.sql.Timestamp;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String password;
	private Integer idAdmin;
	private Timestamp lastLoginTime;
	private Integer isUsered;
	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String userName, String password, Timestamp lastLoginTime) {
		this.userName = userName;
		this.password = password;
		this.lastLoginTime = lastLoginTime;
	}

	/** full constructor */
	public Users(String userName, String password, Integer idAdmin,
			Timestamp lastLoginTime, Integer isUsered) {
		this.userName = userName;
		this.password = password;
		this.idAdmin = idAdmin;
		this.lastLoginTime = lastLoginTime;
		this.isUsered = isUsered;
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getIdAdmin() {
		return this.idAdmin;
	}

	public void setIdAdmin(Integer idAdmin) {
		this.idAdmin = idAdmin;
	}

	public Timestamp getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Integer getIsUsered() {
		return isUsered;
	}

	public void setIsUsered(Integer isUsered) {
		this.isUsered = isUsered;
	}

}