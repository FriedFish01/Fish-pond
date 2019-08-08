package com.delicious.dao;

import java.util.List;

import com.delicious.entity.Foods;

public interface FoodsDao {
	
	//ѡ����ʾǰn����¼
	List<Foods> getTopFoods(int n);
	//��������Ʒ�ҳ��ʾ��ʳ��cid:���title�����ƣ�pageSize��ҳ��
	List<Foods> getFoodsPage(int cid,String title,int pageNum,int pageSize);
	//�����ѯ�����ļ�¼��
	int getFoodsRows(int cid,String title);
	//��ѯ��ʳ����
	Foods getById(int id);
	//��ʳ�б��ҳ
	List<Foods> getAllPage(int pageNum,int pageSize);
	//��ʳ�ܼ�¼��
	int getAllRows();
	//������ʳ
	void addFoods(Foods foods);
	//�޸���ʳ��Ϣ
	void updateFoods(Foods foods);
	//ɾ��
	void deleteFoods(int id);
}
