package com.delicious.biz;

import java.util.List;

import com.delicious.entity.Comments;

public interface CommentsBiz {
	
	List<Comments> getAllCommentsById(int fid);
	void addComments(Comments comments);
}
