package com.delicious.entity;

/**
 * Foods entity. @author MyEclipse Persistence Tools
 */

public class Foods implements java.io.Serializable {

	// Fields

	private Integer id;
	private String chineseName;
	private String englishName;
	private Integer categoryId;
	private String descriptioin;

	// Constructors

	/** default constructor */
	public Foods() {
	}

	/** full constructor */
	public Foods(String chineseName, String englishName, Integer categoryId,
			String descriptioin) {
		this.chineseName = chineseName;
		this.englishName = englishName;
		this.categoryId = categoryId;
		this.descriptioin = descriptioin;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getChineseName() {
		return this.chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}

	public String getEnglishName() {
		return this.englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getDescriptioin() {
		return this.descriptioin;
	}

	public void setDescriptioin(String descriptioin) {
		this.descriptioin = descriptioin;
	}

}