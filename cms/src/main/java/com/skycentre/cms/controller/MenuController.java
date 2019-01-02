package com.skycentre.cms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skycentre.provider.entity.Menu;
import com.skycentre.provider.entity.Tree;
import com.skycentre.provider.entity.TreeNode;
import com.skycentre.provider.service.MenuService;
import com.skycentre.cms.util.StringUtil;

@Controller
@RequestMapping("/menu")
public class MenuController {
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		return "/menu/list";
	}
	
	@RequestMapping(value="/getList",produces="application/json;charset=UTF-8")
	@ResponseBody
	public void getList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		
		List<Menu> menuList = menuService.getList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", menuList);
		map.put("total", menuList.size());
		
		out.println(Json.toJson(map,JsonFormat.full()));
	}
	
	@RequestMapping(value="/getMenuTree",produces="application/json;charset=UTF-8")
	@ResponseBody
	public void getMenuTree(HttpServletRequest request, HttpServletResponse response) throws Exception{
		TreeNode root = new TreeNode("0", "all", "", null);
		
		Tree treeList = new Tree();
		List<Menu> menuList = menuService.getList();
		for (int i = 0; i < menuList.size(); ++i) {
			TreeNode node = new TreeNode(menuList.get(i).getMenuCode()
					.toString(), menuList.get(i).getMenuName().toString(),
					menuList.get(i).get_parentId().toString(),"no");
			treeList.addNode(node);
		}
		
		Tree tree = treeList;
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String jsonStr = tree.getTreeJson(tree, root);
		out.print(jsonStr);
	}
	
	@RequestMapping(value="/getMenuTreeByRoleId",produces="application/json;charset=UTF-8")
	@ResponseBody
	public void getMenuTreeByRoleId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Integer roleId = StringUtil.nullToInteger(request.getParameter("id"));
		
		TreeNode root = new TreeNode("0", "all", "", null);
		
		Tree treeList = new Tree();
		List<Menu> menuList = menuService.getMenuTreeByRoleId(roleId);

		for (int i = 0; i < menuList.size(); ++i) {
			TreeNode node = new TreeNode(menuList.get(i).getMenuCode()
					.toString(), 
					menuList.get(i).getMenuName().toString(),
					menuList.get(i).get_parentId().toString(),
					menuList.get(i).getRight().toString());
			treeList.addNode(node);
		}
		
		Tree tree = treeList;
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String jsonStr = tree.getTreeJson(tree, root);
		out.print(jsonStr);
	}
	
	@RequestMapping(value="/add",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String menuCode = request.getParameter("menuCode");
		String menuName = request.getParameter("menuName");
		String linkUrl = request.getParameter("linkUrl");
		
		Menu m = menuService.getNewestMenu(Integer.parseInt(menuCode));

		Menu menu = new Menu();
		
		if (m != null){
			menu.setMenuCode(m.getMenuCode()+1);
		}else{
			menu.setMenuCode( Integer.parseInt(menuCode + "01") );
		}
		
		menu.setFatherId(Integer.parseInt(menuCode));
		menu.setMenuName(menuName);
		menu.setLinkUrl(linkUrl);
		
		menuService.insert(menu);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "0");
		map.put("message", "新增成功");
		
		return map;
	}
	
	@RequestMapping(value="/delete",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = request.getParameter("id");
		
		menuService.delete(Integer.parseInt(id));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "0");
		map.put("message", "删除成功");
		
		return map;
	}
	
	@RequestMapping(value="/update",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = request.getParameter("id");
		String menuCode = request.getParameter("menuCode");
		String menuName = request.getParameter("menuName");
		String linkUrl = request.getParameter("linkUrl");
		String fatherId = request.getParameter("fatherId");
		
		Menu menu = new Menu();
		menu.setId(Integer.parseInt(id));
		menu.setFatherId(Integer.parseInt(fatherId));
		menu.setMenuCode(Integer.parseInt(menuCode));
		menu.setMenuName(menuName);
		menu.setLinkUrl(linkUrl);
		
		menuService.update(menu);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "0");
		map.put("message", "删除成功");
		
		return map;
	}
}
