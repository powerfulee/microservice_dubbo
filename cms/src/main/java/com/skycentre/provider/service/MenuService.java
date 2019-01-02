package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.Menu;

public interface MenuService {
	List<Menu> getTopMenu(Integer roleId);
	
	List<Menu> getMenuByFatherId(Integer roleId, Integer fatherId);
	
	List<Menu> getList();
	
	List<Menu> getMenuList();
	
	Menu getNewestMenu(Integer menuCode);
	
	Integer insert(Menu menu);
	
	Integer delete(Integer id);
	
	Integer update(Menu menu);
	
	List<Menu> getMenuTreeByRoleId(Integer roleId);
}
