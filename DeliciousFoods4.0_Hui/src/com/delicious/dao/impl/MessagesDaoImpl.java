package com.delicious.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.delicious.dao.MessagesDao;
import com.delicious.entity.Message;

public class MessagesDaoImpl extends HibernateDaoSupport implements MessagesDao{

	@Override
	public List<Message> getMessagesPage(final int pageNum,final int pageSize) {
		return getHibernateTemplate().executeFind(new HibernateCallback<List<Message>>() {

			@Override
			public List<Message> doInHibernate(Session session)
					throws HibernateException, SQLException {

				Query query = session.createQuery("from Message order by publishDate desc");
//				Query query = session.createQuery("from Message m where m.isRead='1' order by publishDate desc");
				query.setMaxResults(pageSize);//ÿһҳ�Ĵ�С
				query.setFirstResult(pageSize*(pageNum-1));//ÿһҳ����ʼ��¼��
				return query.list();
			}
		});
	}
	@Override
	public List<Message> getMessagesPage2(final int pageNum,final int pageSize) {
		return getHibernateTemplate().executeFind(new HibernateCallback<List<Message>>() {

			@Override
			public List<Message> doInHibernate(Session session)
					throws HibernateException, SQLException {

				Query query = session.createQuery("from Message m where order by publishDate desc");
				query.setMaxResults(pageSize);//ÿһҳ�Ĵ�С
				query.setFirstResult(pageSize*(pageNum-1));//ÿһҳ����ʼ��¼��
				return query.list();
			}
		});
	}
	@Override
	public int getMessageRows() {
		//��¼��
		String hql = "select count(*) from Message where isRead='1'";
		return ((Long)getHibernateTemplate().find(hql).get(0)).intValue();
	}
	@Override
	public void addMessages(Message messages) {
		getHibernateTemplate().save(messages);
	}
	@Override
	public List<Message> getAllMessages(final int pageNum, final int pageSize) {
		
		return getHibernateTemplate().executeFind(new HibernateCallback<List<Message>>() {

			@Override
			public List<Message> doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery("from Message order by publishDate desc");
				query.setMaxResults(pageSize);
				query.setFirstResult(pageNum*(pageSize-1));
				return query.list();
			}
		});
	}

	@Override
	public int getAllMessagesRows() {
		String hql = "select count(*) from Message";
		return ((Long)getHibernateTemplate().find(hql).get(0)).intValue();
	}

	@Override
	public Message getById(int id) {
		return getHibernateTemplate().get(Message.class,id);
	}

	@Override
	public void updateMessages(Message message) {
		getHibernateTemplate().update(message);
	}

	public static void main(String[] args) {
		//����ApplicationContext��һ�����󣬴���·���¶�ȡ�����ļ�
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		MessagesDao messagesDao = (MessagesDao) context.getBean("messagesDao");
		System.out.println(messagesDao.getAllMessagesRows());
		System.out.println(messagesDao.getAllMessages(1, 3).size());
	}

	
}
