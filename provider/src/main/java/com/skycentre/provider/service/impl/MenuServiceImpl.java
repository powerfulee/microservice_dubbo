package com.skycentre.provider.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.container.page.Menu;
import com.skycentre.provider.dao.MenuDao;
import com.skycentre.provider.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuDao menuDao;
	
	public List<Menu> getTopMenu(Integer roleId){
		return menuDao.getTopMenu(roleId);
	}
	
	public List<Menu> getMenuByFatherId(Integer roleId, Integer fatherId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", roleId);
		map.put("fatherId", fatherId);
		return menuDao.getMenuByFatherId(map);
	}
	
	public List<Menu> getList(){
		return menuDao.getList();
	}
	
	public List<Menu> getMenuList(){
		return menuDao.getMenuList();
	}
	
	public Menu getNewestMenu(Integer menuCode){
		return menuDao.getNewestMenu(menuCode);
	}
	
	public Integer insert(Menu menu){
		return menuDao.insert(menu);
	}
	
	public Integer delete(Integer id){
		return menuDao.deleteByPrimaryKey(id);
	}
	
	public Integer update(Menu menu){
		return menuDao.updateByPrimaryKeySelective(menu);
	}
	
	public List<Menu> getMenuTreeByRoleId(Integer roleId){
		return menuDao.getMenuTreeByRoleId(roleId);
	}
}
