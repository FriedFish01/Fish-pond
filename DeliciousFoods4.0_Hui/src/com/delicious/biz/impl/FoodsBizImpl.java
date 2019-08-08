package com.delicious.biz.impl;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.delicious.biz.FoodsBiz;
import com.delicious.dao.FoodsDao;
import com.delicious.entity.Foods;

public class FoodsBizImpl implements FoodsBiz{

	private FoodsDao foodsDao;
	
	public void setFoodsDao(FoodsDao foodsDao) {
		this.foodsDao = foodsDao;
	}

	@Override
	public List<Foods> getTopFoods(int n) {
		//�����ṩset��������spring���������ע�뵽��ǰҵ������
		return foodsDao.getTopFoods(n);
	}
	
	@Override
	public List<Foods> getFoodsPage(int cid, String title, int pageNum,
			int pageSize) {
		return foodsDao.getFoodsPage(cid, title, pageNum, pageSize);
	}

	@Override
	public int getFoodsRows(int cid, String title) {
		return foodsDao.getFoodsRows(cid, title);
	}

	@Override
	public Foods getById(int id) {
		return foodsDao.getById(id);
	}
	@Override
	public List<Foods> getAllPage(int pageNum, int pageSize) {
		return foodsDao.getAllPage(pageNum, pageSize);
	}
	@Override
	public int getAllRows() {
		return foodsDao.getAllRows();
	}

	@Override
	public void addFoods(Foods foods) {
		foodsDao.addFoods(foods);
	
	}
	
	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FoodsBiz foodsBiz =  (FoodsBiz) context.getBean("foodsBiz");
		System.out.println(foodsBiz.getTopFoods(2).size());

	}

	@Override
	public void updateFoods(Foods foods) {
		foodsDao.updateFoods(foods);
		
	}

	@Override
	public void deleteFoods(int id) {
		foodsDao.deleteFoods(id);
	}

}
