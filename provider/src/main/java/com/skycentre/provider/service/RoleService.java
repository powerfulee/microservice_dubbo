package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.Role;

public interface RoleService {
	List<Role> getList();
	
	Role getRole(Integer id);
	
	Integer insert(Role role);
	
	Integer update(Role role);
	
	Integer delete(Integer id);
	
	Role getRoleByNameAndTime(String roleName,Long createDate);
}
