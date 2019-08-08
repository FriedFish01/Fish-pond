package com.delicious.action;

import java.util.Date;
import java.util.List;

import com.delicious.biz.CommentsBiz;
import com.delicious.biz.FoodsBiz;
import com.delicious.entity.Comments;
import com.delicious.entity.Foods;
import com.delicious.entity.Users;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentsAction extends ActionSupport{
	
	private CommentsBiz commentsBiz;
	private int id;//美食id
	private List<Comments> commentsList;
	private String content;//评论内容
	private FoodsBiz foodsBiz;
	public void setFoodsBiz(FoodsBiz foodsBiz) {
		this.foodsBiz = foodsBiz;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<Comments> getCommentsList() {
		return commentsList;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setCommentsBiz(CommentsBiz commentsBiz) {
		this.commentsBiz = commentsBiz;
	}
	//查找符合条件的所有评论
	public String search(){
		commentsList = commentsBiz.getAllCommentsById(id);
		return SUCCESS;
	}
	//添加评论
	public String addComments(){
		Comments comments = new Comments();
		comments.setContent(content);
		comments.setPublishDate(new Date());
		Users users = (Users) ActionContext.getContext().getSession().get("users");
		comments.setUsers(users);
		Foods foods = foodsBiz.getById(id);
		comments.setFoods(foods);
		commentsBiz.addComments(comments);
		return null;
		
	}
}
