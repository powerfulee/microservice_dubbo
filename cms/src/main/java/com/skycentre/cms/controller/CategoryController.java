package com.skycentre.cms.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.service.CategoryService;
import com.skycentre.cms.util.StringUtil;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		int page = StringUtil.nullToInteger(request.getParameter("page"), 1);
		
		PageHelper.startPage(page, 10);
		List<Category> categories = categoryService.getList();
		PageInfo<Category> pageInfo = new PageInfo<Category>(categories);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		return "/category/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		String id = "";
		if (request.getParameter("id") != null){
			id = request.getParameter("id");
			Category category = categoryService.getCategory(Integer.parseInt(id));
			modelMap.addAttribute("category",category);
		}
		return "/category/detail";
	}
	
	@RequestMapping(value="/put",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> put(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception{
		String categoryName = request.getParameter("categoryName");
		String status = request.getParameter("status");
		
		Category category = new Category();
		category.setStatus(Integer.parseInt(status));
		category.setCategoryName(categoryName);
		
		if (request.getParameter("id") != ""){
			String id = request.getParameter("id");
			category.setId(Integer.parseInt(id));
			
			categoryService.update(category);
		}else{
			categoryService.insert(category);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", 0);
		map.put("message", "提交成功");
		
		return map;
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception{
		String id = request.getParameter("id");
		
		categoryService.delete(Integer.parseInt(id));
		
		return "redirect:/category/list";
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		int page = StringUtil.nullToInteger(request.getParameter("page"), 1);
		String categoryName = StringUtil.nullToString(request.getParameter("categoryName"));
		Integer status = StringUtil.nullToInteger(request.getParameter("status"));
		String beginDate = StringUtil.nullToString(request.getParameter("beginDate"));
		String endDate = StringUtil.nullToString(request.getParameter("endDate"));
		
		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setStatus(status);
		category.setBeginDate(beginDate);
		category.setEndDate(endDate);
		
		PageHelper.startPage(page, 10);
		List<Category> categories = categoryService.search(category);
		PageInfo<Category> pageInfo = new PageInfo<Category>(categories);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		return "/category/list";
	}
}
