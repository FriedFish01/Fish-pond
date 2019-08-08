package com.delicious.biz;

import java.util.List;

import com.delicious.entity.Message;

public interface MessagesBiz {
	//��ҳ
	List<Message> getMessagesPage(int pageNum,int pageSize);
	//��ҳ
	List<Message> getMessagesPage2(int pageNum,int pageSize);
	//��¼��
	int getMessageRows();
	//��������
	void addMessages(Message messages);
	//�������Է�ҳ
	List<Message> getAllMessages(int pageNum,int pageSize);
	//�ܼ�¼��
	int getAllMessagesRows();
	//��ѯ��������
	Message getById(int id);
	//�޸�����״̬
	void updateMessages(Message message);
}
