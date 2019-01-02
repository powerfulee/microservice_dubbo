package com.skycentre.frontend.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.skycentre.frontend.util.DeviceUtil;
import com.skycentre.frontend.util.StringUtil;
import com.skycentre.provider.entity.Blog;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.entity.Reply;
import com.skycentre.provider.service.BlogService;
import com.skycentre.provider.service.CategoryService;
import com.skycentre.provider.service.ReplyService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ReplyService replyService;
	
	private static Log log = LogFactory.getLog("access");
	
	@RequestMapping("/list/{id}")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			@PathVariable("id") String id,
			@RequestParam(required = true, defaultValue = "1", value = "page") int page) throws Exception{
		
		String browser = DeviceUtil.getBrowserName(request.getHeader("User-Agent").toLowerCase());
		String ipAddress = DeviceUtil.getIpAddr(request);
		String previous = request.getHeader("Referer");
		
		log.debug(browser + "," + ipAddress + "," + previous + "," + "list/" + id + "," + System.currentTimeMillis());
		
		Integer categoryId = Integer.parseInt(id);
		
		//当前类别及列表
		List<Category> categories = categoryService.getList();
		modelMap.addAttribute("categories",categories);
		
		Category category = categoryService.getCategory(categoryId);
		modelMap.addAttribute("category",category);
		
		//文章列表
		int rows = 10;
		Integer rowsTotal = blogService.getCountByCategory(categoryId);
		int pageTotal = (int)Math.ceil((rowsTotal+rows-1)/rows);
		
		List<Blog> blogs = blogService.getListByCategoryToFrontend(categoryId,page,rows);
		
		List<Blog> blogList = new ArrayList<Blog>();
		
		for (Blog blog : blogs){
			Blog b = new Blog();
			
			b.setId(blog.getId());
			b.setCategoryId(blog.getCategoryId());
			b.setCategoryName(blog.getCategoryName());
			b.setTitle(blog.getTitle());
			if (blog.getContent().length() < 200){
				b.setContent(blog.getContent());
			}else{
				String content = blog.getContent().replace("<br>", "<br/>").replace("<BR>", "<br/>");
				b.setContent(StringUtil.cutPrettyHtmlString(content,200,true) + "...");
			}
			b.setCreateDate(blog.getCreateDate());
			
			blogList.add(b);
		}
		
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogList);
		pageInfo.setPageNum(page);
		pageInfo.setPages(pageTotal);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		
		//最新5篇文章
		List<Blog> newestBlogs = blogService.getNewestBlogs();
		modelMap.addAttribute("newestBlogs", newestBlogs);
								
		//最新5篇评论
		List<Reply> newestReplies = replyService.getNewestReplies();
		modelMap.addAttribute("newestReplies",newestReplies);
						
		//归档文章
		List<Blog> years = blogService.getYears();
		modelMap.addAttribute("years", years);
				
		//当前路径
		String contextPath = request.getContextPath();
		modelMap.addAttribute("contextPath",contextPath);
		
		return "/list";
	}
}
