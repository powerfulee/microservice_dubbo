package com.skycentre.frontend.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.skycentre.frontend.util.DeviceUtil;
import com.skycentre.frontend.util.StringUtil;
import com.skycentre.provider.entity.Blog;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.entity.Reply;
import com.skycentre.provider.entity.Role;
import com.skycentre.provider.service.BlogService;
import com.skycentre.provider.service.CategoryService;
import com.skycentre.provider.service.ReplyService;
import com.skycentre.provider.service.RoleService;

@Controller
@RequestMapping("/")
public class IndexController {
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private ReplyService replyService;
	
	private static Log log = LogFactory.getLog("access");
	
	@RequestMapping("/")
	public String index(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
		@RequestParam(required = true, defaultValue = "1", value = "page") int page) throws Exception{
		
		String browser = DeviceUtil.getBrowserName(request.getHeader("User-Agent").toLowerCase());
		String ipAddress = DeviceUtil.getIpAddr(request);
		String previous = request.getHeader("Referer");
		
		log.debug(browser + "," + ipAddress + "," + previous + "," + request.getRequestURL() + "," + System.currentTimeMillis());
		
		List<Category> categories = categoryService.getList();
		modelMap.addAttribute("categories",categories);
		
		int rows = 10;
		Integer rowsTotal = blogService.getCount();
		int pageTotal = (int)Math.ceil((rowsTotal+rows-1)/rows);
				
		List<Blog> blogs = blogService.getListToFrontend(page,rows);
		
		List<Blog> blogList = new ArrayList<Blog>();
		
		for (Blog blog : blogs){
			Blog b = new Blog();
			
			b.setId(blog.getId());
			b.setCategoryId(blog.getCategoryId());
			b.setCategoryName(blog.getCategoryName());
			b.setTitle(blog.getTitle());
			
			String content = StringUtil.htmlRemoveTag(blog.getContent().replaceAll("<br>", "<br/>").replaceAll("<BR>", "<br/>").replaceAll("\r\n", ""));
			
			String imgTag = "";
			if (blog.getContent().length() > 300) {
				imgTag = StringUtil.getImgTag(blog.getContent().substring(0,300));
			}else {
				imgTag = StringUtil.getImgTag(blog.getContent());
			}
			
			if (content.length() < 200){
				b.setContent(blog.getContent());
			}else{
				//content = blog.getContent().replaceAll("<br>", "<br/>").replaceAll("<BR>", "<br/>").replaceAll("\r\n", "");
				b.setContent(imgTag + content.substring(0,200) + "......");
			}
			b.setCreateDate(blog.getCreateDate());
			
			blogList.add(b);
		}
		
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogList);
		pageInfo.setPageNum(page);
		pageInfo.setPages(pageTotal);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		
		List<Role> roles = roleService.getList();
		modelMap.addAttribute("roles", roles);
				
		String contextPath = request.getContextPath();
		modelMap.addAttribute("contextPath",contextPath);
		
		//最新5篇文章
		List<Blog> newestBlogs = blogService.getNewestBlogs();
		modelMap.addAttribute("newestBlogs", newestBlogs);
				
		//最新5篇评论
		List<Reply> newestReplies = replyService.getNewestReplies();
		modelMap.addAttribute("newestReplies",newestReplies);
		
		//归档文章
		List<Blog> years = blogService.getYears();
		modelMap.addAttribute("years", years);
		
		return "/index";
	}
			
	public static JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {   
    	ObjectMapper mapper = new ObjectMapper();
    	return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);   
    }
}
