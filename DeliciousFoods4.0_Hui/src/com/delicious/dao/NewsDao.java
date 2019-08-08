package com.delicious.dao;

import java.util.List;

import com.delicious.entity.Category;
import com.delicious.entity.News;

public interface NewsDao {
	List<News> getAll();
	//
	List<News> getTopNews(int n);
	//
	List<News> getNewsPage(int pageNum,int pageSize);
	//
	int getNewsCount();
	//
	News getById(int id);
	//
	int getPrevNewsId(int id);
	int getNextNewsId(int id);
	//分页
	List<News> getAllPage(int pageNum,int pageSize);
	//总记录
	int getAllRows();
	//添加
	void addNews(News news);
	//修改
	void updateNews(News news);
	//删除
	void deleteNews(int id);
}
