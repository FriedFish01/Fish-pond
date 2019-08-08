package com.delicious.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.delicious.dao.CategoryDao;
import com.delicious.entity.Category;
import com.delicious.entity.Foods;

public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao{

	@Override
	public List<Category> getAll() {
		return getHibernateTemplate().find("from Category");
	}

	@Override
	public Category getById(int id) {
		
		return getHibernateTemplate().get(Category.class,id);
	}

	@Override
	public List<Category> getAllPage(final int pageNum,final int pageSize) {
		return getHibernateTemplate().executeFind(new HibernateCallback<List<Category>>() {

			@Override
			public List<Category> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql="from Category f where 1=1 ";

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
	public int getAllRows() {
		return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql="select count(*) from Category f where 1=1 ";
				Map<String,Object> map = new HashMap<String,Object>();
				
				Query query = session.createQuery(hql);
				//׷�Ӳ���
				query.setProperties(map);
				//object�����ʺϷ���һ��ֵ�����
				Object object = query.uniqueResult();
				return ((Long)object).intValue();
			}
		});
	}

	@Override
	public void addCategory(Category categories) {
		getHibernateTemplate().save(categories);
	}

	@Override
	public void updateCategory(Category categories) {
		getHibernateTemplate().update(categories);
	}

	@Override
	public void deleteCategory(int id) {
		HibernateTemplate template = getHibernateTemplate();
		Category categories = template.get(Category.class,id);
		if(categories!=null){
			template.delete(categories);
		}
	}
	
}
