package com.skycentre.frontend.controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.skycentre.frontend.util.DeviceUtil;
import com.skycentre.frontend.util.NetUtil;
import com.skycentre.frontend.util.StringUtil;
import com.skycentre.provider.entity.Blog;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.entity.Logs;
import com.skycentre.provider.entity.Reply;
import com.skycentre.provider.service.BlogService;
import com.skycentre.provider.service.CategoryService;
import com.skycentre.provider.service.LogService;
import com.skycentre.provider.service.ReplyService;

@Controller
@RequestMapping("/blog")
public class BlogController {
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private LogService logService;
	
	private static Log log = LogFactory.getLog("access");
	
	@RequestMapping("/detail/{id}")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			@PathVariable("id") String id) throws Exception{
		
		String browser = DeviceUtil.getBrowserName(request.getHeader("User-Agent").toLowerCase());
		String ipAddress = DeviceUtil.getIpAddr(request);
		String previous = request.getHeader("Referer");
		
		log.debug(browser + "," + ipAddress + "," + previous + "," + request.getRequestURL() + "," + System.currentTimeMillis());
		
		Blog blog = blogService.getBlog(Integer.parseInt(id));
		blog.setContent(blog.getContent().replaceAll("_small", ""));
				
		modelMap.addAttribute("blog", blog);
		
		List<Category> categories = categoryService.getList();
		modelMap.addAttribute("categories",categories);
		
		String contextPath = request.getContextPath();
		modelMap.addAttribute("contextPath",contextPath);
		
		List<Reply> replies = replyService.getListByBlog(Integer.parseInt(id));
		modelMap.addAttribute("replies",replies);
		
		//下一篇
		Blog nextBlog = blogService.getBlogToNext(1,blog.getCreateDate());
		modelMap.addAttribute("nextBlog",nextBlog);
		//上一篇
		Blog preBlog = blogService.getBlogToNext(2,blog.getCreateDate());
		modelMap.addAttribute("preBlog",preBlog);
		
		//最新5篇文章
		List<Blog> newestBlogs = blogService.getNewestBlogs();
		modelMap.addAttribute("newestBlogs", newestBlogs);
						
		//最新5篇评论
		List<Reply> newestReplies = replyService.getNewestReplies();
		modelMap.addAttribute("newestReplies",newestReplies);
				
		//归档文章
		List<Blog> years = blogService.getYears();
		modelMap.addAttribute("years", years);
				
		return "/detail";
	}
	
	@RequestMapping("/search")
	public String index(HttpServletRequest request, 
			HttpServletResponse response, 
			ModelMap modelMap,
		@RequestParam(required = true, value = "keyword") String keyword,
		@RequestParam(required = true, defaultValue = "1", value = "page") int page
			) throws Exception{
		
		Long rowsTotal = blogService.getSearchCountByES(keyword);
		int rows = 10;
		int pageTotal = (int)Math.ceil((rowsTotal+rows-1)/rows);
		
		List<Blog> blogs = blogService.search(keyword, page);
		
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
		pageInfo.setPageNum(page);
		pageInfo.setPages(pageTotal);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		modelMap.addAttribute("keyword", keyword);
		
		List<Category> categories = categoryService.getList();
		modelMap.addAttribute("categories",categories);
		
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
				
		return "/search";
	}
	
	@RequestMapping("/insertLog")
	@ResponseBody
	public void insertLog(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String result = NetUtil.getRemoteStream(request);
		
		List<Logs> logs = (List<Logs>)Json.fromJson( new LinkedList<Logs>() {}.getClass().getGenericSuperclass(), result);
		
		logService.minsert(logs);
		
		System.out.println(logs);
	}
	
	@RequestMapping("/list/{year}")
	public String detail(HttpServletRequest request, 
			HttpServletResponse response, 
			ModelMap modelMap,
			@PathVariable("year") Integer year,
			@RequestParam(required = true, defaultValue = "1", value = "page") int page) throws Exception{
		
		//当前类别
		Category category = new Category();
		category.setCategoryName(year.toString() + "年");
		modelMap.addAttribute("category", category);
		
		//类别列表
		List<Category> categories = categoryService.getList();
		modelMap.addAttribute("categories",categories);
		
		//文章列表
		int rows = 10;
		Integer rowsTotal = blogService.getCountByYear(year);
		int pageTotal = (int)Math.ceil((rowsTotal+rows-1)/rows);
		
		List<Blog> blogs = blogService.getBlogsByYear(year,page,rows);
		
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
		
		//获取路径
		String contextPath = request.getContextPath();
		modelMap.addAttribute("contextPath",contextPath);
		
		return "/list";
	}
}
