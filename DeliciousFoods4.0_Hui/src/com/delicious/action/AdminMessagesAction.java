package com.delicious.action;

import java.util.List;

import com.delicious.biz.MessagesBiz;
import com.delicious.entity.Message;
import com.opensymphony.xwork2.ActionSupport;

public class AdminMessagesAction extends ActionSupport{
	
	private MessagesBiz messagesBiz;
	//���Լ���messagesList��ÿҳ��Сҳ����ҳ��
	private List<Message> messagesList;
	private int pageSize = 5;
	private int pageNum = 1;
	private int pageCount;
	//总数据条数
	private int count;
	public void setCount(int count) {
		this.count = count;
	}
	public int getCount() {
		return count;
	}
	//批量操作数据储存处
	private List<Integer> ck;
	public void setCk(List<Integer> ck) {
		this.ck = ck;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public List<Message> getMessagesList() {
		return messagesList;
	}

	public int getPageCount() {
		return pageCount;
	}
	
	public void setMessagesBiz(MessagesBiz messagesBiz) {
		this.messagesBiz = messagesBiz;
	}
	
	//�����б�
	public String list(){

		messagesList = messagesBiz.getMessagesPage(pageNum, pageSize);
		int rows = messagesBiz.getAllMessagesRows();
		count =  rows;
		pageCount = (int)Math.ceil((double)rows/pageSize);
		
		return "list_success";
	}
	//���ÿɶ�
	public String enable(){
		for(Integer integer:ck){
			Message messages = messagesBiz.getById(integer);
			System.out.println("messages.setIsRead()?"+messages.getIsRead());
			messages.setIsRead(1);
			System.out.println("messages.setIsRead()?"+messages.getIsRead());
			messagesBiz.updateMessages(messages);
		}
		return "enable_success";
	}
	//���ò��ɶ�
	public String disable(){
		for(Integer integer:ck){
			Message messages = messagesBiz.getById(integer);
			messages.setIsRead(0);
			System.out.println("messages.setIsRead(1)?"+messages.getIsRead());
			messagesBiz.updateMessages(messages);
		}
		return "disable_success";
	}
	
}
