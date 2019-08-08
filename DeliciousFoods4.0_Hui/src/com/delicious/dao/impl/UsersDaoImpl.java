package com.delicious.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.jmx.HibernateService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.delicious.dao.FoodsDao;
import com.delicious.dao.UsersDao;
import com.delicious.entity.Message;
import com.delicious.entity.Users;

public class UsersDaoImpl extends HibernateDaoSupport implements UsersDao{

	@Override
	public Users checkLogin(String username, String password) {
		//账号密码正确并且是启用状态才可以登录成功(其实就是返回对应的数据)
		String hql="from Users u where u.userName=? and u.password=?";
		List<Users> usersList = getHibernateTemplate().find(hql,username,password);

		return usersList.size()>0?usersList.get(0):null;
	}

	@Override
	public List<Users> getAllUsers(final int pageNum,final int pageSize) {
		return getHibernateTemplate().executeFind(new HibernateCallback<List<Users>>() {

			@Override
			public List<Users> doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery("from Users order by id asc");
				query.setMaxResults(pageSize);
				query.setFirstResult(pageNum*(pageSize-1));
				return query.list();
			}
		});
	}
	@Override
	public int getAllUsersRows() {
		String hql = "select count(*) from Users where 1='1'";
		return ((Long)getHibernateTemplate().find(hql).get(0)).intValue();
	}
	@Override
	public Users getById(int id) {
		
		return getHibernateTemplate().get(Users.class,id);
	}
	@Override
	public void updateUsers(Users users) {
		getHibernateTemplate().update(users);
	}
	public int getIsUsered(String userName){
		String hql = "select isUsered from Users where userName=1";
		return ((Long)getHibernateTemplate().find(hql).get(0)).intValue();
	}
	
	public static void main(String[] args) {
		//����ApplicationContext��һ�����󣬴���·���¶�ȡ�����ļ�
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UsersDao usersDao = (UsersDao) context.getBean("usersDao");
		System.out.println(usersDao.checkLogin("admin", "123"));
		System.out.println(usersDao.getAllUsersRows());
		System.out.println(usersDao.getAllUsers(1, 4).size());
//		System.out.println(usersDao.getIsUsered("admin"));
		System.out.println(usersDao.isExist("admin"));
	}

	@Override
	public void addUsers(Users users) {
		getHibernateTemplate().save(users);
	}

	@Override
	public int isExist(String userName){
//		String hql = "select count(*) from Users where userName=?";
//		return ((Long)getHibernateTemplate().find(hql).get(0)).intValue();
		String hql="from Users u where u.userName=? ";
		List<Users> usersList = getHibernateTemplate().find(hql,userName);
		//存在返回1，否则返回0
		return usersList.size()>0?1:0;
	}


}
