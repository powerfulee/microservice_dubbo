package com.skycentre.provider.dao;

import com.skycentre.provider.entity.AdminRight;

public interface AdminRightDao {
    int deleteByPrimaryKey(Integer id);

    int insert(AdminRight record);

    int insertSelective(AdminRight record);

    AdminRight selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AdminRight record);

    int updateByPrimaryKey(AdminRight record);
    
}