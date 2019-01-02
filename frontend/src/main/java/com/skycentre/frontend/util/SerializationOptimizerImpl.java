package com.skycentre.frontend.util;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import com.alibaba.dubbo.common.serialize.support.SerializationOptimizer;
import com.skycentre.provider.entity.Admin;
import com.skycentre.provider.entity.AdminRight;
import com.skycentre.provider.entity.Blog;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.entity.Menu;
import com.skycentre.provider.entity.Role;
import com.skycentre.provider.entity.RoleRight;

public class SerializationOptimizerImpl implements SerializationOptimizer{
	@SuppressWarnings("rawtypes")
	public Collection<Class> getSerializableClasses() {
		List<Class> classes = new LinkedList<Class>();
		
		classes.add(Admin.class);
		classes.add(AdminRight.class);
		classes.add(Blog.class);
		classes.add(Category.class);
		classes.add(Menu.class);
		classes.add(Role.class);
		classes.add(RoleRight.class);
		
		return classes;
	}
}
