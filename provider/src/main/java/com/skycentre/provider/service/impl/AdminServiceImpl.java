package com.skycentre.provider.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycentre.provider.dao.AdminDao;
import com.skycentre.provider.entity.Admin;
import com.skycentre.provider.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	
	public Admin login(Admin admin){
		return adminDao.login(admin);
	}
	
	public int insert(Admin admin){
		return adminDao.insertSelective(admin);
	}
	
	public List<Admin> getList(){
		return adminDao.getList();
	}
	
	public Admin getAdmin(Integer id){
		return adminDao.selectByPrimaryKey(id);
	}
	
	public Integer update(Admin admin){
		return adminDao.updateByPrimaryKeySelective(admin);
	}
	
	public Integer delete(Integer id){
		return adminDao.deleteByPrimaryKey(id);
	}
}
