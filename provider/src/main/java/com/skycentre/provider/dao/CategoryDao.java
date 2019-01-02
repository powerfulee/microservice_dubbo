package com.skycentre.provider.dao;

import java.util.List;

import com.skycentre.provider.entity.Category;

public interface CategoryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
    
    List<Category> getList();
    
    List<Category> search(Category category);
}