package com.delicious.action;


import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.delicious.biz.CategoryBiz;
import com.delicious.biz.FoodsBiz;
import com.delicious.entity.Category;
import com.delicious.entity.Foods;
import com.delicious.entity.Message;
import com.opensymphony.xwork2.ActionSupport;

public class AdminFoodsAction extends ActionSupport{
	private FoodsBiz foodsBiz;
	//��ҳ��¼
	private List<Foods> foodsList;
	//��ǰҳ��
	private int pageNum=1;
	//ÿҳ�Ĵ�С
	private int pageSize=8;
	
	//��ҳ��
	private int pageCount;
	//���������
	private CategoryBiz categoryBiz;
	private Foods foods;
	private List<Category> categories;
	//图片，文件形式上传
	private File foodsImage;
	//���
	private int id;
	//批量操作数据储存处
	private List<Integer> ck;
	public void setCk(List<Integer> ck) {
		this.ck = ck;
	}
	//总数据条数
	private int count;
	public void setCount(int count) {
		this.count = count;
	}
	public int getCount() {
		return count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setFoodsImage(File foodsImage) {
		this.foodsImage = foodsImage;
	}
	public List<Category> getCategories() {
		return categories;
	}
	public Foods getFoods() {
		return foods;
	}
	public void setFoods(Foods foods) {
		this.foods = foods;
	}
	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}
	public void setFoodsBiz(FoodsBiz foodsBiz) {
		this.foodsBiz = foodsBiz;
	}
	public List<Foods> getFoodsList() {
		return foodsList;
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
	//得到页数pageCount等
	public String list(){
		foodsList = foodsBiz.getAllPage(pageNum, pageSize);
		count = foodsBiz.getAllRows();
		pageCount = (int)Math.ceil((double)count/pageSize);
		
		return "list_success";
	}
	//编辑
	public String edit(){
		categories = categoryBiz.getAll();
		if(id>0){
			foods = foodsBiz.getById(id);
		}
		return "edit_success";
	}
	//保存
	public String save(){
		try {
			if(id>0){
				foodsBiz.updateFoods(foods);
			}
			else{
				foodsBiz.addFoods(foods);
			}
			//判断是否需要上传文件
			if(foodsImage!=null){
				//获取文件物理路径
				String path = ServletActionContext.getServletContext().getRealPath("/image/menus");
				String fileName = path+"/"+foods.getEnglishName()+".jpg";
				//新建文件，用于存储strut2服务器上的临时目录中的文件
				File uploadFile = new File(fileName);
				try {
					FileUtils.copyFile(foodsImage, uploadFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return "save_success";
		} catch (Exception e) {
			e.printStackTrace();
			return "save_input";
		}
	}
	//delete
	public String delete() {
		if (ck == null || ck.size() == 0) {
			foodsBiz.deleteFoods(id);
		} else {
			for (Integer integer : ck) {
				foodsBiz.deleteFoods(integer);
			}
		}
		return "delete_success";
	}
	
}
