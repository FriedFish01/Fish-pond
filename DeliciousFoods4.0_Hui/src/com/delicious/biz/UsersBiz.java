package com.delicious.biz;

import java.util.List;

import com.delicious.entity.Category;
import com.delicious.entity.News;
import com.delicious.entity.Users;

public interface UsersBiz {
	Users checkLogin(String username,String password);
	//查看所有用户分页
	List<Users> getAllUsers(int pageNum,int pageSize);
	
	//总记录数
	int getAllUsersRows();
	//查看记录详细
	Users getById(int id);
	//修改用户状态
	void updateUsers(Users users);
	int getIsUsered(String userName);
	//添加
	void addUsers(Users users);
	//通过用户名判断是否存在
	int isExist(String userName);
}
