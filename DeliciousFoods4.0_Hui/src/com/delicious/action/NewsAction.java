package com.delicious.action;

import java.util.List;

import com.delicious.biz.NewsBiz;
import com.delicious.entity.News;
import com.opensymphony.xwork2.ActionSupport;

public class NewsAction extends ActionSupport{
	private NewsBiz newsBiz;
	//����pageNum��pageSize,List<News> int rows
	int pageSize = 6;
	int pageNum = 1;
	int pageCount;
	List<News> newsList;
	private int id;//���ŵ�id
	
	private News news;//���Ŷ���
	private int prevId;//��һƪ���ŵ�id
	private int nextId;//��һƪ���ŵ�id
	
	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getPageCount() {
		return pageCount;
	}
	
	public List<News> getNewsList() {
		return newsList;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public News getNews() {
		return news;
	}
	//�����б�
	public String list(){
		newsList = newsBiz.getNewsPage(pageNum, pageSize);
		//�ܼ�¼��
		int count = newsBiz.getNewsCount();
		pageCount = (int)Math.ceil((double)count/pageSize);
		
		return SUCCESS;
	}
	//��������
	public String details(){
		news=newsBiz.getById(id);
		return SUCCESS;
	}
	//������һƪ���ŵ�id
	public int getPrevId(){
		prevId = newsBiz.getPrevNewsId(id);
		System.out.println("prevId="+prevId);
		return prevId;
	}
	//������һƪ���ŵ�id
		public int getNextId(){
			nextId = newsBiz.getNextNewsId(id);
			System.out.println("nextId="+nextId);
			return nextId;
	}
		
		
}
