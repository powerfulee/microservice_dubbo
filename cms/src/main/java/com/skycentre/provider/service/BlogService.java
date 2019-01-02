package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.Blog;

public interface BlogService {
	List<Blog> getList(Integer offset,Integer limit);
	
	List<Blog> getListByCategory(Integer categoryId,Integer offset,Integer limit);
	
	Integer insert(Blog blog);
	
	Blog getBlog(Integer id);
	
	Integer update(Blog blog);
	
	Integer delete (Integer id);
	
	List<Blog> search(Blog blog);
	
	List<Blog> search(String keyword,Integer page);
	
	Long getSearchCountByES(String keyword);
	
	Integer getCount();
	
	Integer getCountByCategory(Integer categoryId);
}
