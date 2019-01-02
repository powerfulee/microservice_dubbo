package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.Admin;

public interface AdminService {
	Admin login(Admin admin);
	
	int insert(Admin admin);
	
	List<Admin> getList();
	
	Admin getAdmin(Integer id);
	
	Integer update(Admin admin);
	
	Integer delete(Integer id);
}
