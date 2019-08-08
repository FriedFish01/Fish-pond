package com.delicious.biz.impl;

import java.util.List;

import com.delicious.biz.MessagesBiz;
import com.delicious.dao.MessagesDao;
import com.delicious.entity.Message;

public class MessagesBizImpl implements MessagesBiz{

	private MessagesDao messagesDao;
	
	public void setMessagesDao(MessagesDao messagesDao) {
		this.messagesDao = messagesDao;
	}

	@Override
	public List<Message> getMessagesPage(int pageNum, int pageSize) {
		return messagesDao.getMessagesPage(pageNum, pageSize);
	}
	@Override
	public List<Message> getMessagesPage2(int pageNum, int pageSize) {
		return messagesDao.getMessagesPage(pageNum, pageSize);
	}

	@Override
	public int getMessageRows() {
		return messagesDao.getMessageRows();
	}

	@Override
	public void addMessages(Message messages) {
		messagesDao.addMessages(messages);
	}

	@Override
	public List<Message> getAllMessages(int pagNum, int pageSize) {
		return messagesDao.getAllMessages(pagNum, pageSize);
		
	}

	@Override
	public int getAllMessagesRows() {
		return messagesDao.getMessageRows();
	}

	@Override
	public Message getById(int id) {
		
		return messagesDao.getById(id);
	}

	@Override
	public void updateMessages(Message messages) {
		messagesDao.updateMessages(messages);
	}

}
