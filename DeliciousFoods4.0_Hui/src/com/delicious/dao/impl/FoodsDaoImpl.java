package com.delicious.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.delicious.dao.FoodsDao;
import com.delicious.entity.Foods;
//�̳�hibernate��support��ʵ�������Լ�д�Ľӿ�
public class FoodsDaoImpl extends HibernateDaoSupport implements FoodsDao{

	@Override
	public List<Foods> getTopFoods(final int n) {

		return getHibernateTemplate().executeFind(new HibernateCallback<List<Foods>>() {

			@Override
			public List<Foods> doInHibernate(Session session)
					throws HibernateException, SQLException {
				//�����Foodsָ����ʵ����
				return session.createQuery("from Foods").setMaxResults(n).list();
			}
		});
	}
	@Override//��ҳ
	public List<Foods> getFoodsPage(final int cid, final String title, final int pageNum,
			final int pageSize) {
		
		return getHibernateTemplate().executeFind(new HibernateCallback<List<Foods>>() {

			@Override
			public List<Foods> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql="from Foods f where 1=1 ";
				//Map��hibernate�ṩ�ķ���,���԰Ѽ���׷�ӽ�ȥ
				Map<String,Object> map = new HashMap<String, Object>();
				if(cid>0){
					hql+=" and f.categoryId=:cid ";
					map.put("cid",cid);
				}
				if(title!=null&&!title.isEmpty()){
					hql+=" and f.chineseName like:title ";
					map.put("title","%"+title+"%");
				}
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
	@Override//��¼��
	public int getFoodsRows(final int cid, final String title) {
		
		return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql="select count(*) from Foods f where 1=1 ";
				Map<String,Object> map = new HashMap<String,Object>();
				if(cid>0){
					hql+=" and f.categoryId=:cid";
					map.put("cid",cid);
				}
				if(title!=null&&!title.isEmpty()){
					hql+=" and f.chineseName like:title";
					map.put("title","%"+title+"%");
				}
				Query query = session.createQuery(hql);
				//׷�Ӳ���
				query.setProperties(map);
				//object�����ʺϷ���һ��ֵ�����
				Object object = query.uniqueResult();
				//��Ϊcount��*�����ص���һ��long������͵Ķ���
				//����ҲҪ��long��ת����
				return ((Long)object).intValue();
			}
		});
	}
	@Override
	public Foods getById(int id) {
		return getHibernateTemplate().get(Foods.class, id);
	}
	@Override
	public List<Foods> getAllPage(final int pageNum,final int pageSize) {
		
		return getHibernateTemplate().executeFind(new HibernateCallback<List<Foods>>() {

			@Override
			public List<Foods> doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery("from Foods");
				query.setFirstResult(pageSize*(pageNum-1));
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
	}
	@Override
	public int getAllRows() {
		
		return ((Long)getHibernateTemplate().find("select count(*) from Foods").get(0)).intValue();
	}
	@Override
	public void addFoods(Foods foods) {
		getHibernateTemplate().save(foods);
	}
	@Override
	public void updateFoods(Foods foods) {
		getHibernateTemplate().update(foods);
		
	}
	@Override
	public void deleteFoods(int id) {
		HibernateTemplate template = getHibernateTemplate();
		Foods foods = template.get(Foods.class,id);
		if(foods!=null){
			template.delete(foods);
		}
	}
	public static void main(String[] args) {
		//����ApplicationContext��һ�����󣬴���·���¶�ȡ�����ļ�
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FoodsDao foodsDao = (FoodsDao) context.getBean("foodsDao");
		System.out.println(foodsDao.getAllRows());
		System.out.println(foodsDao.getAllPage(1, 5).size());
		
	}

}
