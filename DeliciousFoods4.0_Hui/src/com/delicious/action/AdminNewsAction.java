package com.delicious.action;

import java.util.List;


import com.delicious.biz.NewsBiz;
import com.delicious.entity.News;
import com.opensymphony.xwork2.ActionSupport;

public class AdminNewsAction extends ActionSupport{
		private NewsBiz newsBiz;
		public NewsBiz getNewsBiz() {
			return newsBiz;
		}
		private News news;
		public News getNews() {
			return news;
		}
		public void setNews(News news) {
			this.news = news;
		}
		//��ҳ��¼
		private List<News> news_List;
		//��ǰҳ��
		private int pageNum=1;
		//ÿҳ�Ĵ�С
		private int pageSize=6;
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		//��ҳ��
		private int pageCount;
		//���
		private int id;//菜系编号
		//总数据条数
		private int count;
		public void setCount(int count) {
			this.count = count;
		}
		public int getCount() {
			return count;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public List<News> getNewsList() {
			return news_List;
		}
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
		//返回数据
		public String list(){
			news_List = newsBiz.getAllPage(pageNum, pageSize);
			count = newsBiz.getAllRows();
			pageCount = (int)Math.ceil((double)count/pageSize);	
			
			return "list_success";
		}
		//������ʳ
		public String edit(){
			
			if(id>0){
				news = newsBiz.getById(id);
				System.out.println("categories="+news);
			}
			
			return "edit_success";
		}
		//添加，保存
		public String save(){
			try {
				if(id>0){
					newsBiz.updateNews(news);
				}
				else{
					newsBiz.addNews(news);
				}
				return "save_success";
			} catch (Exception e) {
				e.printStackTrace();
				return "save_input";
			}
		}
		//ɾ��
		public String delete(){
			newsBiz.deleteNews(id);
			return "delete_success";
		}
	}
