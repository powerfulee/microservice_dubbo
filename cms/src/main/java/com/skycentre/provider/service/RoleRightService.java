package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.RoleRight;

public interface RoleRightService {
	Integer insert(RoleRight rr);
	
	Integer deleteByRoleId(Integer roleId);
	
	Integer insertBatch(List<RoleRight> rrList);
}
