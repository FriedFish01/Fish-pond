package com.delicious.biz.impl;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.delicious.biz.CommentsBiz;
import com.delicious.dao.CommentsDao;
import com.delicious.entity.Comments;

public class CommentsBizImpl implements CommentsBiz{

	private CommentsDao commentsDao;
	
	public void setCommentsDao(CommentsDao commentsDao) {
		this.commentsDao = commentsDao;
	}

	@Override
	public List<Comments> getAllCommentsById(int fid) {
		return commentsDao.getAllCommentsById(fid);
	}

	@Override
	public void addComments(Comments comments) {
		commentsDao.addComments(comments);
		
	}
	public static void main(String[] args) {
		//构建ApplicationContext的一个对象，从类路径下读取配置文件
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CommentsDao commentsDao = (CommentsDao) context.getBean("commentsDao");
		System.out.println(commentsDao.getAllCommentsById(2).size());
		
	}
}
