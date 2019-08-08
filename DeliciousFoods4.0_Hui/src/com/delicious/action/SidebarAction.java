package com.delicious.action;

import java.util.List;

import com.delicious.biz.CategoryBiz;
import com.delicious.entity.Category;
import com.opensymphony.xwork2.ActionSupport;

public class SidebarAction extends ActionSupport{
	
	private CategoryBiz categoryBiz;
	private List<Category> categories;
	
	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}
	public List<Category> getCategories() {
		return categories;
	}
	
	public String execute(){
		categories = categoryBiz.getAll();
		return SUCCESS;
	}
}
