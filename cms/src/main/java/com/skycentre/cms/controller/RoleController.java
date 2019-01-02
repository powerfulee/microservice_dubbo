package com.skycentre.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycentre.provider.entity.Role;
import com.skycentre.provider.entity.RoleRight;
import com.skycentre.provider.service.RoleRightService;
import com.skycentre.provider.service.RoleService;
import com.skycentre.cms.util.StringUtil;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private RoleRightService roleRightService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		int page = StringUtil.nullToInteger(request.getParameter("page"), 1);
		
		PageHelper.startPage(page, 10);
		List<Role> roles = roleService.getList();
		PageInfo<Role> pageInfo = new PageInfo<Role>(roles);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		return "/role/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		String id = "";
		if (request.getParameter("id") != null){
			id = request.getParameter("id");
			Role role = roleService.getRole(Integer.parseInt(id));
			modelMap.addAttribute("role",role);
		}
		return "/role/detail";
	}
	
	@RequestMapping(value="/put",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> put(HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession httpSession,
			@RequestParam(value = "roleName", required = true) String roleName,
			@RequestParam(value = "menuCode", required = true) String menuCode) throws Exception{

		Role role = new Role();
		role.setRoleName(roleName);
		
		Long createDate = System.currentTimeMillis();
		
		if (request.getParameter("id") != ""){
			String id = request.getParameter("id");
			role.setId(Integer.parseInt(id));
			
			roleRightService.deleteByRoleId(Integer.parseInt(id));
			
			roleService.update(role);
		}else{
			role.setCreateDate(createDate);
			
			roleService.insert(role);
		}
		
		Role r = roleService.getRoleByNameAndTime(roleName, createDate);
		
		String[] menuCodeArr = menuCode.split(",");
		
		List<RoleRight> rrList = new ArrayList<RoleRight>();

		for (String mCode : menuCodeArr){
			RoleRight rr = new RoleRight();
			rr.setRoleId(r.getId());
			rr.setMenuCode(Integer.parseInt( mCode ));
			
			rrList.add(rr);
		}
		
		Integer recCode = roleRightService.insertBatch(rrList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (recCode > 0){
			map.put("status", 0);
			map.put("message", "提交成功");
		}else{
			map.put("status", 1);
			map.put("message", "提交失败");
		}
		
		return map;
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession httpSession,
			@RequestParam(value = "id", required = true) String id) throws Exception{
		
		roleRightService.deleteByRoleId(Integer.parseInt(id));
		roleService.delete(Integer.parseInt(id));

		return "redirect:/role/list";
	}
}
