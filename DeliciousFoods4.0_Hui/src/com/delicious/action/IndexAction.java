package com.delicious.action;

import java.util.List;

//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;

//import org.springframework.web.context.ContextLoaderListener;

import com.delicious.biz.FoodsBiz;
import com.delicious.biz.NewsBiz;
import com.delicious.entity.Foods;
import com.delicious.entity.News;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{
	private FoodsBiz foodsBiz;
	private NewsBiz newsBiz;
	public void setFoodsBiz(FoodsBiz foodsBiz) {
		this.foodsBiz = foodsBiz;
	}
	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}
	//��װfoodsList��newsList
	private List<Foods> foodsList; 
	private List<News> newsList;
	public List<Foods> getFoodsList() {
		return foodsList;
	}
	public List<News> getNewsList() {
		return newsList;
	}
	
	//��ʾ���ź���ʳ
	public String index(){
		//ִ��ҵ���biz�ķ������ؽ��
		newsList = newsBiz.getTopNews(5);
		foodsList = foodsBiz.getTopFoods(3);
		
		return SUCCESS;
	}

}
