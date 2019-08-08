package com.delicious.biz;

import java.util.List;

import com.delicious.entity.Category;
import com.delicious.entity.News;

public interface NewsBiz {
	List<News> getTopNews(int n);
	List<News> getNewsPage(int pageNum,int pageSize);
	List<News> getAll();
	int getNewsCount();
	News getById(int id);
	//��ȡ��һ������id
	int getPrevNewsId(int id);
	//��ȡ��һ������id
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
