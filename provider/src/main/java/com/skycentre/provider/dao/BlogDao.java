package com.skycentre.provider.dao;

import java.util.List;
import java.util.Map;

import com.skycentre.provider.entity.Blog;

public interface BlogDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKeyWithBLOBs(Blog record);

    int updateByPrimaryKey(Blog record);
    
    List<Blog> getList(Map<String,Object> map);
    
    Blog getBlogToNext(Map<String,Object> map);
    
    List<Blog> getListByCategory(Map<String,Object> map);
    
    List<Blog> search(Blog blog);
    
    Integer getCount();
    
    Integer getCountByCategory(Integer CategoryId);
    
    List<Blog> getNewestBlogs();
    
    List<Blog> getYears();
    
    List<Blog> getBlogsByYear(Map<String,Object> map);
    
    Integer getCountByYear(Long year);
}