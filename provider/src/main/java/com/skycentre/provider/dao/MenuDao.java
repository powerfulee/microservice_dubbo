package com.skycentre.provider.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.dubbo.container.page.Menu;

public interface MenuDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
    
    List<Menu> getTopMenu(Integer roleId);
    
    List<Menu> getMenuByFatherId(Map<String,Object> map);
    
    List<Menu> getList();
    
    List<Menu> getMenuList();
    
    Menu getNewestMenu(Integer menuCode);
    
    List<Menu> getMenuTreeByRoleId(Integer roleId);
}