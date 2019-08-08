package com.delicious.dao;

import java.util.List;

import com.delicious.entity.Comments;

public interface CommentsDao {
	//按照id查询
	List<Comments> getAllCommentsById(int fid);
	//插入评论
	void addComments(Comments comments);
}
