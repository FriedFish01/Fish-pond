package com.delicious.action;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.delicious.biz.MessagesBiz;
//import com.delicious.dao.MessagesDao;
import com.delicious.entity.Message;
import com.opensymphony.xwork2.ActionSupport;

public class MessagesAction extends ActionSupport{
	private MessagesBiz messagesBiz;
	private int pageSize = 5;
	private int pageNum = 1;
	private int pageCount;
	private List<Message> messagesList;
	private Message messages;//���������õ�
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageCount() {
		return pageCount;
	}

	public List<Message> getMessagesList() {
		return messagesList;
	}

	public void setMessagesBiz(MessagesBiz messagesBiz) {
		this.messagesBiz = messagesBiz;
	}
	public Message getMessages() {
		return messages;
	}

	public void setMessages(Message messages) {
		this.messages = messages;
	}
	//���ڲ�ѯ��һҳ���Եļ�¼
	public String list(){
		messagesList = messagesBiz.getMessagesPage(pageNum, pageSize);
		int rows = messagesBiz.getMessageRows();
		pageCount = (int) Math.ceil((double)rows/pageSize);
		return SUCCESS;
				
	}
	//��������
	public String save(){
		messages.setPublishDate(new Timestamp(System.currentTimeMillis()));
		messages.setIsRead(0);
		messagesBiz.addMessages(messages);
		
		return SUCCESS;
	}
	
}
