package com.delicious.biz;

import java.util.List;

import com.delicious.entity.Category;

public interface CategoryBiz {
	List<Category> getAll();
	Category getById(int id);
	//分页
	List<Category> getAllPage(int pageNum,int pageSize);
	//总记录
	int getAllRows();
	//添加
	void addCategory(Category categories);
	//修改
	void updateCategory(Category categories);
	//删除
	void deleteCategory(int id);
}
