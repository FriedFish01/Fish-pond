package com.delicious.dao;

import java.util.List;

import com.delicious.entity.Comments;

public interface CommentsDao {
	//����id��ѯ
	List<Comments> getAllCommentsById(int fid);
	//��������
	void addComments(Comments comments);
}
