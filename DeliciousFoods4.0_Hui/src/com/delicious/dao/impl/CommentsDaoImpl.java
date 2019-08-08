package com.delicious.dao.impl;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.delicious.dao.CommentsDao;
import com.delicious.entity.Comments;

public class CommentsDaoImpl extends HibernateDaoSupport implements CommentsDao{

	@Override
	public List<Comments> getAllCommentsById(int fid) {
		String hql = "from Comments c where c.foods.id=? order by 'publishDate' desc";
		
		return getHibernateTemplate().find(hql,fid);
	}

	@Override
	public void addComments(Comments comments) {
		getHibernateTemplate().save(comments);
	}
	
	public static void main(String[] args) {
		//构建ApplicationContext的一个对象，从类路径下读取配置文件
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		CommentsDao commentsDao = (CommentsDao) context.getBean("commentsDao");
		System.out.println(commentsDao.getAllCommentsById(1).size());
		
	}

}
