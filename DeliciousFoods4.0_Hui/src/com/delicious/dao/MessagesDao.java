package com.delicious.dao;

import java.util.List;

import com.delicious.entity.Message;


public interface MessagesDao {
	//得到所有可读
	List<Message> getMessagesPage(int pageNum,int pageSize);
	//得到所有
	List<Message> getMessagesPage2(int pageNum,int pageSize);
	//��¼��
	int getMessageRows();
	//��������
	void addMessages(Message messages);
	//�������Է�ҳ
	List<Message> getAllMessages(int pagNum,int pageSize);
	//�ܼ�¼��
	int getAllMessagesRows();
	//��ѯ��������
	Message getById(int id);
	//�޸�����״̬
	void updateMessages(Message message);
}
