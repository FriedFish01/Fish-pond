package com.delicious.biz.impl;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.delicious.biz.FoodsBiz;
import com.delicious.biz.UsersBiz;
import com.delicious.dao.UsersDao;
import com.delicious.entity.News;
import com.delicious.entity.Users;

public class UsersBizImpl implements UsersBiz{

	private UsersDao usersDao;
	
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	@Override
	public Users checkLogin(String username, String password) {
		
		return usersDao.checkLogin(username, password);
	}

	@Override
	public List<Users> getAllUsers(int pageNum, int pageSize) {
		return usersDao.getAllUsers(pageNum, pageSize);
	}

	@Override
	public int getAllUsersRows() {
		return usersDao.getAllUsersRows();
	}

	@Override
	public Users getById(int id) {
		return usersDao.getById(id);
	}

	@Override
	public void updateUsers(Users users) {
		usersDao.updateUsers(users);
	}

	@Override
	public int getIsUsered(String userName) {
		return usersDao.getIsUsered(userName);
	}

	@Override
	public void addUsers(Users users) {
		usersDao.addUsers(users);
	}

	@Override
	public int isExist(String userName) {
		return usersDao.isExist(userName);
	}
}
