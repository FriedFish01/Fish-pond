package com.delicious.action;

import java.util.Date;
import java.util.List;

import com.delicious.biz.UsersBiz;
import com.delicious.entity.Users;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Timestamp;

public class AdminUsersAction extends ActionSupport {

	private UsersBiz usersBiz;

	public void setUsersBiz(UsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}

	// 返回到界面的用户集合
	private List<Users> usersList;
	private int pageSize = 8;
	private int pageNum = 1;
	private int pageCount;
	// CheckBox的选中状态
	private List<Integer> ck;
	private int id;//菜系编号
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setCk(List<Integer> ck) {
		this.ck = ck;
	}
	// 总数据条数
	private int count;

	public void setCount(int count) {
		this.count = count;
	}

	public int getCount() {
		return count;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public List<Users> getUsersList() {
		return usersList;
	}

	public int getPageCount() {
		return pageCount;
	}

	// 用户列表
	public String list() {
		usersList = usersBiz.getAllUsers(pageNum - 1, pageSize);
		count = usersBiz.getAllUsersRows();
		pageCount = (int) Math.ceil((double) count / pageSize);
		return "list_success";
	}

	// 启用
	public String enable() {
		for (Integer integer : ck) {
			Users users = usersBiz.getById(integer);
			users.setIsUsered(1);
			// 修改最后登录时间
			Date da = new Date();
			Timestamp ts = new Timestamp(da.getTime());
			users.setLastLoginTime(ts);
			//
			usersBiz.updateUsers(users);
		}
		return "enable_success";
	}

	// 禁用
	public String disable() {
		for (Integer integer : ck) {
			Users users = usersBiz.getById(integer);
			users.setIsUsered(0);
			usersBiz.updateUsers(users);
		}
		return "disable_success";
	}

}
