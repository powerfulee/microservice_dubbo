package com.skycentre.provider.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycentre.provider.dao.RoleRightDao;
import com.skycentre.provider.entity.RoleRight;
import com.skycentre.provider.service.RoleRightService;

@Service("roleRightService")
public class RoleRightServiceImpl implements RoleRightService{
	@Autowired
	private RoleRightDao roleRightDao;
	
	public Integer insert(RoleRight rr){
		return roleRightDao.insertSelective(rr);
	}
	
	public Integer deleteByRoleId(Integer roleId){
		return roleRightDao.deleteByRoleId(roleId);
	}
	
	public Integer insertBatch(List<RoleRight> rrList){
		return roleRightDao.insertBatch(rrList);
	}
}
