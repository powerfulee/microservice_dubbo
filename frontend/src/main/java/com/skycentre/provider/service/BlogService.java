package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.Blog;

public interface BlogService {
	List<Blog> getList(Integer offset, Integer limit);
	
	List<Blog> getListToFrontend(Integer offset, Integer limit);
	
	List<Blog> getListByCategory(Integer categoryId, Integer offset, Integer limit);
	
	List<Blog> getListByCategoryToFrontend(Integer categoryId,Integer offset,Integer limit);
	
	Integer insert(Blog blog);
	
	Blog getBlog(Integer id);
	
	Blog getBlogToNext(Integer type,Long createDate);
	
	Integer update(Blog blog);
	
	Integer delete (Integer id);
	
	List<Blog> search(Blog blog);
	
	Integer getCount();
	
	List<Blog> search(String keyword,Integer page);
	
	Long getSearchCountByES(String keyword);
	
	Integer getCountByCategory(Integer categoryId);
	
	List<Blog> getNewestBlogs();
	
	List<Blog> getYears();
	
	List<Blog> getBlogsByYear(Integer year,Integer offset,Integer limit);
	
	Integer getCountByYear(Integer year);
}
