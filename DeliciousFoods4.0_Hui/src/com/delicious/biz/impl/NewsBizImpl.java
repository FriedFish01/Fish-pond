package com.delicious.biz.impl;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import com.delicious.biz.FoodsBiz;
import com.delicious.biz.NewsBiz;
import com.delicious.dao.NewsDao;
import com.delicious.entity.Category;
import com.delicious.entity.News;

public class NewsBizImpl implements NewsBiz{

	private NewsDao newsDao;
	
	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	@Override
	public List<News> getTopNews(int n) {
		return newsDao.getTopNews(n);
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		NewsBiz newsBiz =  (NewsBiz) context.getBean("newsBiz");
		System.out.println(newsBiz.getTopNews(1).size());
		System.out.println(newsBiz.getNextNewsId(2));
	}

	@Override
	public List<News> getNewsPage(int pageNum, int pageSize) {
		
		return newsDao.getNewsPage(pageNum, pageSize);
	}

	@Override
	public int getNewsCount() {
		
		return newsDao.getNewsCount();
	}

	@Override
	public News getById(int id) {
		
		return newsDao.getById(id);
	}

	@Override
	public int getPrevNewsId(int id) {
		//
		return newsDao.getPrevNewsId(id);
	}

	@Override
	public int getNextNewsId(int id) {
		// 
		return newsDao.getNextNewsId(id);
	}

	@Override
	public int getAllRows() {
		return newsDao.getAllRows();
	}

	@Override
	public void addNews(News news) {
		newsDao.addNews(news);
	}

	@Override
	public void updateNews(News news) {
		newsDao.updateNews(news);
	}

	@Override
	public void deleteNews(int id) {
		newsDao.deleteNews(id);
	}

	@Override
	public List<News> getAllPage(int pageNum, int pageSize) {
		return newsDao.getAllPage(pageNum, pageSize);
	}

	@Override
	public List<News> getAll() {
		return newsDao.getAll();
	}
}
