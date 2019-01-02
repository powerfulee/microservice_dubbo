package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.Category;

public interface CategoryService {
	List<Category> getList();
	
	Integer insert(Category category);
	
	Integer delete(Integer id); 
	
	Category getCategory(Integer id);
	
	Integer update (Category category);
	
	List<Category> search(Category category);
}
