package com.skycentre.provider.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycentre.provider.dao.CategoryDao;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryDao categoryDao;
	
	public List<Category> getList(){
		return categoryDao.getList();
	}
	
	public Integer insert(Category category){
		return categoryDao.insert(category);
	}
	
	public Integer delete(Integer id){
		return categoryDao.deleteByPrimaryKey(id);
	}
	
	public Category getCategory(Integer id){
		return categoryDao.selectByPrimaryKey(id);
	}
	
	public Integer update(Category category){
		return categoryDao.updateByPrimaryKey(category);
	}
	
	public List<Category> search(Category category){
		return categoryDao.search(category);
	}
}
