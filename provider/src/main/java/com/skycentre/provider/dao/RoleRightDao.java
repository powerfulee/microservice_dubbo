package com.skycentre.provider.dao;

import java.util.List;

import com.skycentre.provider.entity.RoleRight;

public interface RoleRightDao {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleRight record);

    int insertSelective(RoleRight record);

    RoleRight selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleRight record);

    int updateByPrimaryKey(RoleRight record);
    
    int deleteByRoleId(Integer roleId);
    
    Integer insertBatch(List<RoleRight> rrList);
}