package com.delicious.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.delicious.biz.CategoryBiz;
import com.delicious.entity.Category;
import com.opensymphony.xwork2.ActionSupport;

public class AdminCategoryAction extends ActionSupport {
	private CategoryBiz categoryBiz;
	private Category categories;

	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}

	// ��ҳ��¼
	private List<Category> categoriesList;
	// ��ǰҳ��
	private int pageNum = 1;
	// ÿҳ�Ĵ�С
	private int pageSize = 8;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	// ��ҳ��
	private int pageCount;
	// ���
	private int id;// 菜系编号
	// 总数据条数
	private int count;
	// 批量操作数据储存处
	private List<Integer> ck;

	public void setCk(List<Integer> ck) {
		this.ck = ck;
	}

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

	public List<Category> getCategoriesList() {
		return categoriesList;
	}

	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
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

	// ��ѯ��ʳ�б�
	public String list() {
		categoriesList = categoryBiz.getAllPage(pageNum, pageSize);
		count = categoryBiz.getAllRows();
		// ������ҳ��/Math.ceil(double d)
		pageCount = (int) Math.ceil((double) count / pageSize);

		return "list_success";
	}

	// ������ʳ
	public String edit() {

		if (id > 0) {
			categories = categoryBiz.getById(id);
		}

		return "edit_success";
	}

	// �༭������ʳ��Ϣ
	public String save() {
		try {
			if (id > 0) {
				categoryBiz.updateCategory(categories);
			} else {
				categoryBiz.addCategory(categories);
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
			categoryBiz.deleteCategory(id);
		} else {
			for (Integer integer : ck) {
				categoryBiz.deleteCategory(integer);
			}
		}
		return "delete_success";
	}
}
