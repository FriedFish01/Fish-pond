package com.delicious.biz;

import java.util.List;

import com.delicious.entity.Foods;

public interface FoodsBiz {
	List<Foods> getTopFoods(int n);
	
	//按类别，名称分页显示美食，cid:类别；title：名称，pageSize：页数
	List<Foods> getFoodsPage(int cid,String title,int pageNum,int pageSize);
	//满足查询条件的记录数
	int getFoodsRows(int cid,String title);
	Foods getById(int id);
	//美食列表分页
	List<Foods> getAllPage(int pageNum,int pageSize);
	//美食总记录表
	int getAllRows();
	//新增美食
	void addFoods(Foods foods);
	//修改美食信息
	void updateFoods(Foods foods);
	//删除
	void deleteFoods(int id);
}
