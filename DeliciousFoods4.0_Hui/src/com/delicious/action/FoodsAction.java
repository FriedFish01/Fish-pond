package com.delicious.action;

import java.util.List;

import com.delicious.biz.CategoryBiz;
import com.delicious.biz.FoodsBiz;
import com.delicious.entity.Category;
import com.delicious.entity.Foods;
import com.opensymphony.xwork2.ActionSupport;

public class FoodsAction extends ActionSupport{
	private FoodsBiz foodsBiz;
	private CategoryBiz categoryBiz;
	private int id;
	private Foods foods;
	
	//��ҳ��¼
	private List<Foods> foodsList;
	//��ǰҳ��
	private int pageNum=1;
	//���id
	private int cid;
	//���
	private String title;
	//ÿҳ�Ĵ�С
	private int pageSize=8;
	//��ҳ��
	private int pageCount;
	
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
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Foods getFoods() {
		return foods;
	}
	
	//��ѯ��ʳ�б�
	public String list(){
		foodsList = foodsBiz.getFoodsPage(cid, title, pageNum, pageSize);
		int rows = foodsBiz.getFoodsRows(cid, title);
		//������ҳ��/Math.ceil(double d)
		pageCount = (int)Math.ceil((double)rows/pageSize);
		return SUCCESS;
	}
	//��ȡ������
	public String getCategoryName(){
		Category category = categoryBiz.getById(cid);
		if(category!=null){
			return category.getName();
		}
		else{
			return "";
		}
	}
	//��ѯ��ʳ����
	public String details(){
		foods = foodsBiz.getById(id);
		return SUCCESS;
	}
	public String delete(){
		foodsBiz.deleteFoods(id);
		return SUCCESS;
	}
}
