package com.delicious.biz.impl;

import java.util.List;

import com.delicious.biz.CategoryBiz;
import com.delicious.dao.CategoryDao;
import com.delicious.entity.Category;

public class CategoryBizImpl implements CategoryBiz{

	private CategoryDao categoryDao;
	
	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	@Override
	public List<Category> getAll() {
		return categoryDao.getAll();
	}

	@Override
	public Category getById(int id) {
		
		return categoryDao.getById(id);
	}

	@Override
	public List<Category> getAllPage(int pageNum, int pageSize) {
		return categoryDao.getAllPage(pageNum, pageSize);
	}

	@Override
	public int getAllRows() {
		return categoryDao.getAllRows();
	}

	@Override
	public void addCategory(Category categories) {
		categoryDao.addCategory(categories);
	}

	@Override
	public void updateCategory(Category categories) {
		categoryDao.updateCategory(categories);
	}

	@Override
	public void deleteCategory(int id) {
		categoryDao.deleteCategory(id);
	}

}
