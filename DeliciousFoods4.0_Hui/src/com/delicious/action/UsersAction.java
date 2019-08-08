package com.delicious.action;

import java.sql.Timestamp;
import java.util.Date;

import com.delicious.biz.UsersBiz;

import com.delicious.entity.Users;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UsersAction extends ActionSupport {
	private Users users;
	private UsersBiz usersBiz;
	private String username;
	private String password;
	private String message;
	private int id;// 用户编号
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUsersBiz(UsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	// 登录验证
	public String doLogin() {
		Users users = usersBiz.checkLogin(username, password);
		if (users == null) {
			message = "账号或密码错误，请重新输入...";
			return LOGIN;
		} else if (users.getIsUsered() == 0) {
			message = "账号禁用，未能正常登陆。";
			return LOGIN;
		} else {
			// 修改最后登录时间
			Date da = new Date();
			Timestamp ts = new Timestamp(da.getTime());
			users.setLastLoginTime(ts);
			ActionContext.getContext().getSession().put("users", users);
			return SUCCESS;	
		}
	}

	// 退出登录
	public String signOut() {
		Users users = (Users) ActionContext.getContext().getSession()
				.get("users");
		if (users != null) {
			ActionContext.getContext().getSession().remove("users");
		}
		return SUCCESS;
	}

	// 添加，保存
	public String saveUsers() {
		try {
			if (id > 0) {
				usersBiz.updateUsers(users);
				return SUCCESS;
			} else {
				if(usersBiz.isExist(users.getUserName())==1){
					System.out.println("用户名已存在。");
					return "join";
				}
				else{
					// 修改最后登录时间等信息
					Date da = new Date();
					Timestamp ts = new Timestamp(da.getTime());
					users.setLastLoginTime(ts);
					users.setIsUsered(1);
					users.setIdAdmin(1);
					usersBiz.addUsers(users);
					return SUCCESS;
				}	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "join";
		}
	}
}
