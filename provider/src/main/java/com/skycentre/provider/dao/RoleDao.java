package com.skycentre.provider.dao;

import java.util.List;
import java.util.Map;

import com.skycentre.provider.entity.Role;

public interface RoleDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> getList();
    
    Role getRoleByNameAndTime(Map<String,Object> map);
}