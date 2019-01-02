package com.skycentre.cms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.nutz.json.Json;
import org.nutz.mapl.Mapl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycentre.cms.util.MD5Util;
import com.skycentre.cms.util.StringUtil;
import com.skycentre.provider.entity.Admin;
import com.skycentre.provider.entity.CommCode;
import com.skycentre.provider.entity.CommResp;
import com.skycentre.provider.entity.Role;
import com.skycentre.provider.service.AdminService;
import com.skycentre.provider.service.RoleService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/insert", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		String password = MD5Util.md5(request.getParameter("password").getBytes());
		Integer roleId = StringUtil.nullToInteger(request.getParameter("roleId"));
		
		Admin admin = new Admin();
		admin.setRoleId(roleId);
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setCreateDate(new Date());
		
		int recCode = 1;
		if (request.getParameter("id") != ""){
			admin.setId(Integer.parseInt(request.getParameter("id")));
			adminService.update(admin);
		}else{
			recCode = adminService.insert(admin);
		}

		Map<String, Object> map = new HashMap<String, Object>();

		if (recCode == 1) {
			map.put("status", 0);
			map.put("result", "注册成功");
		} else {
			map.put("status", 1);
			map.put("result", "注册失败");
		}

		return map;
	}

	@RequestMapping(value = "/signin", produces = "application/json;charset=UTF-8")
	@ResponseBody
	@SuppressWarnings("unchecked")
	public CommResp signin(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession,
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "validateCode", required = true) String validateCode) throws Exception {

		String kaptchaCode = (String) request.getSession()
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);

		Admin a = new Admin();
		CommResp commResp = new CommResp();
		
		if (validateCode.equals(kaptchaCode)) {
			Admin admin = new Admin();
			admin.setUsername(username);
			admin.setPassword(MD5Util.md5(password.getBytes()));

			a = adminService.login(admin);
			
			if (a != null) {
				commResp.setMessage("登陆成功");
				commResp.setStatus("0");
				commResp.setResult(a);
				
				Date now = new Date();
				
				httpSession.setAttribute("roleId", a.getRoleId());
				httpSession.setAttribute("username", a.getUsername());
				httpSession.setAttribute("userId", a.getId());
				httpSession.setAttribute("loginTime", now.toString());
			} else {
				commResp.setMessage("登陆失败");
				commResp.setStatus("1");
			}
		} else {
			commResp.setMessage("验证码错误");
			commResp.setStatus("1");
		}

		List<String> filterList = new ArrayList<String>();
		if (a != null) {
			filterList.add("result.user.password");
		}

		return commResp;
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		int page = StringUtil.nullToInteger(request.getParameter("page"), 1);
		
		PageHelper.startPage(page, 15);
		List<Admin> admins = adminService.getList();
		PageInfo<Admin> pageInfo = new PageInfo<Admin>(admins);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		
		return "/admin/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		List<Role> roles = roleService.getList();
		
		if (request.getParameter("id") != null){
			Integer id = StringUtil.nullToInteger(request.getParameter("id"));
			Admin admin = adminService.getAdmin(id);
			
			modelMap.addAttribute("admin",admin);
		}
		
		modelMap.addAttribute("roles",roles);
		
		return "/admin/detail";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception{
		String id = request.getParameter("id");
		
		adminService.delete(Integer.parseInt(id));
		
		return "redirect:/admin/list";
	}
}
