package com.skycentre.provider.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycentre.provider.dao.RoleDao;
import com.skycentre.provider.entity.Role;
import com.skycentre.provider.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleDao roleDao;
	
	public List<Role> getList(){
		return roleDao.getList();
	}
	
	public Role getRole(Integer id){
		return roleDao.selectByPrimaryKey(id);
	}
	
	public Integer insert (Role role){
		return roleDao.insertSelective(role);
	}
	
	public Integer update (Role role){
		return roleDao.updateByPrimaryKeySelective(role);
	}
	
	public Integer delete (Integer id){
		return roleDao.deleteByPrimaryKey(id);
	}
	
	public Role getRoleByNameAndTime(String roleName,Long createDate){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleName", roleName);
		map.put("createDate", createDate);
		
		return roleDao.getRoleByNameAndTime(map);
	}
}
