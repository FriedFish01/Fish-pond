package com.delicious.dao.impl;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.delicious.dao.NewsDao;
import com.delicious.entity.Category;
import com.delicious.entity.News;
//�̳�hibernate��support��ʵ�������Լ�д�Ľӿ�
public class NewsDaoImpl extends HibernateDaoSupport implements NewsDao{

	@Override
	public List<News> getTopNews(final int n) {

		return getHibernateTemplate().executeFind(new HibernateCallback<List<News>>() {

			@Override
			public List<News> doInHibernate(Session session)
					throws HibernateException, SQLException {
				//�����Newsָ����ʵ�����е�News.Java,���ذ�publishdate���������
				return session.createQuery("from News order by publishdate desc").setMaxResults(n).list();
			}
		});
	}

	@Override
	public List<News> getNewsPage(final int pageNum,final int pageSize) {
		
		return getHibernateTemplate().executeFind(new HibernateCallback<List<News>>() {

			@Override
			public List<News> doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from News n order by n.publishDate desc";
				Query query = session.createQuery(hql);
				//������ʼ��¼��
				query.setFirstResult(pageSize*(pageNum-1));
				//����ÿҳ��С
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
	}

	@Override
	public int getNewsCount() {
		
		return ((Long)getHibernateTemplate().find("select count(*) from News").get(0)).intValue();
	}
	@Override
	public News getById(int id) {
		//get():����Ű����ȥ��ѯ�ķ���
		return getHibernateTemplate().get(News.class, id);
	}
	@Override// 获取上一个新闻的id
	public int getPrevNewsId(final int id) {
		return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				//
				String hql="select id from News f where 1=1 ";
				Map<String,Object> map = new HashMap<String,Object>();
				if(id>0){
					hql+=" and f.id<:id order by publishDate desc limit 1";
					map.put("id",id);
				}

				Query query = session.createQuery(hql);
				//׷�Ӳ���
				query.setProperties(map);
				//object�����ʺϷ���һ��ֵ�����
				Object object = query.uniqueResult();
				//����ҲҪ��long��ת����
				return (Integer) query.uniqueResult();
			}
		});
	}

	@Override// 下一个新闻的id
	public int getNextNewsId(final int id) {
		return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				//
				String sql="select id from news where id+=1 order by id desc limit 1";
				SQLQuery query = session.createSQLQuery(sql);
				query.setInteger(0, id);
				return ((BigDecimal)query.uniqueResult()).intValue();
			}
		});
	}
	
	
	
	public static void main(String[] args) {
		//����ApplicationContext��һ�����󣬴���·���¶�ȡ�����ļ�
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		NewsDao newsDao = (NewsDao) context.getBean("newsDao");
		System.out.println(newsDao.getPrevNewsId(5));
		System.out.println(newsDao.getNewsCount());
		
		
	}

	@Override
	public int getAllRows() {
		return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql="select count(*) from News where 1=1 ";
				Map<String,Object> map = new HashMap<String,Object>();
				
				Query query = session.createQuery(hql);
				//׷�Ӳ���
				query.setProperties(map);
				Object object = query.uniqueResult();
				return ((Long)object).intValue();
			}
		});
	}

	@Override
	public void addNews(News news) {
		getHibernateTemplate().save(news);
	}

	@Override
	public void updateNews(News news) {
		getHibernateTemplate().update(news);
	}

	@Override
	public void deleteNews(int id) {
		HibernateTemplate template = getHibernateTemplate();
		News news = template.get(News.class,id);
		if(news!=null){
			template.delete(news);
		}
	}

	@Override
	public List<News> getAllPage(final int pageNum,final int pageSize) {
		return getHibernateTemplate().executeFind(new HibernateCallback<List<News>>() {

			@Override
			public List<News> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql="from News where 1=1 ";

				Map<String,Object> map = new HashMap<String, Object>();
				Query query = session.createQuery(hql);
				//׷�Ӳ���
				query.setProperties(map);
				//����ÿҳ����ʼ��¼��
				query.setFirstResult(pageSize*(pageNum-1));
				//����ÿҳ��С
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
	}

	@Override
	public List<News> getAll() {
		return getHibernateTemplate().find("from News");
	}
}
