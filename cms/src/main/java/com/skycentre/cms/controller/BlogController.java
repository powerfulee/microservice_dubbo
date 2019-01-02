package com.skycentre.cms.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.skycentre.cms.util.ConfigUtil;
import com.skycentre.cms.util.DateUtil;
import com.skycentre.cms.util.ImageUtil;
import com.skycentre.cms.util.StringUtil;
import com.skycentre.provider.entity.Blog;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.service.BlogService;
import com.skycentre.provider.service.CategoryService;

@Controller
@RequestMapping("/blog")
public class BlogController {
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CategoryService categoryService;
	
	static org.apache.commons.logging.Log log = LogFactory.getLog(BlogController.class);
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
		@RequestParam(required = true, defaultValue = "1", value = "page") int page) throws Exception{
		
		int rows = 15;
		Integer rowsTotal = blogService.getCount();
		int pageTotal = (int)Math.ceil((rowsTotal+rows-1)/rows);
		
		List<Blog> blogs = blogService.getList((page-1)*rows,rows);
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
		pageInfo.setPageNum(page);
		pageInfo.setPages(pageTotal);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		return "/blog/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		int page = StringUtil.nullToInteger(request.getParameter("page"), 1);
		
		String id = "";
		if (request.getParameter("id") != null){
			id = request.getParameter("id");
			Blog blog = blogService.getBlog(Integer.parseInt(id));
			modelMap.addAttribute("blog",blog);
		}
		
		List<Category> categories = categoryService.getList();
		modelMap.addAttribute("categories",categories);
		
		modelMap.addAttribute("page",page);
		
		return "/blog/detail";
	}
	
	@RequestMapping(value="/put",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> put(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception{
		String categoryId = request.getParameter("categoryId");
		String status = request.getParameter("status");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		int page = StringUtil.nullToInteger(request.getParameter("page"), 1);
		
		Category category = categoryService.getCategory(Integer.parseInt(categoryId));
		
		Blog blog = new Blog();
		blog.setCategoryId(Integer.parseInt(categoryId));
		blog.setCategoryName(category.getCategoryName());
		blog.setTitle(title);
		blog.setContent(content);
		blog.setStatus(Integer.parseInt( status ));
		
		if (request.getParameter("id") != ""){
			String id = request.getParameter("id");
			
			Blog b = blogService.getBlog(Integer.parseInt(id));
			
			blog.setId(Integer.parseInt(id));
			blog.setCommentTotal(b.getCommentTotal());
			blog.setCreateDate(b.getCreateDate());
			
			blogService.update(blog);
		}else{
			blog.setCommentTotal(0);
			blog.setCreateDate(System.currentTimeMillis());
			
			blogService.insert(blog);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", 0);
		map.put("page", page);
		map.put("message", "提交成功");
		
		return map;
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception{
		String id = request.getParameter("id");
		
		blogService.delete(Integer.parseInt(id));
		
		return "redirect:/blog/list";
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		int page = StringUtil.nullToInteger(request.getParameter("page"), 1);
		String title = StringUtil.nullToString(request.getParameter("title"));
		Integer status = StringUtil.nullToInteger(request.getParameter("status"));
		String beginDate = StringUtil.nullToString(request.getParameter("beginDate"));
		String endDate = StringUtil.nullToString(request.getParameter("endDate"));
		
		Blog blog = new Blog();
		blog.setTitle(title);
		blog.setStatus(status);
		blog.setBeginDate(beginDate);
		blog.setEndDate(endDate);
		
		PageHelper.startPage(page, 15);
		List<Blog> blogs = blogService.search(blog);
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
		
		modelMap.addAttribute("pageInfo", pageInfo);
		return "/blog/list";
	}
	
	@RequestMapping("fileUpload")
    public void fileUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //用来检测程序运行时间
        long startTime = System.currentTimeMillis();
        System.out.println("fileName：" + startTime);
         
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        
        MultipartFile file = null;
        
        String dirName = "";
        String newFileName = "";
        String samllFileName = "";
        
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request)){
        	//将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
           //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();
             
            String uploadPath = ConfigUtil.getUploadPath();
            log.debug("the file path: " + uploadPath);
            
            while(iter.hasNext()){
                //一次遍历所有文件
                file = multiRequest.getFile(iter.next().toString());
                if(file != null)
                {
                	String fileName = file.getOriginalFilename();
                	String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
                	newFileName = startTime + "." + suffix;
                	samllFileName = startTime + "_small." + suffix;
                	
                	dirName = DateUtil.getSysDate();
                	StringUtil.createDir(uploadPath + "article/" + dirName);
                	
                	String path = uploadPath + "article/" + dirName + "/";
                	
                    //上传图片
                    file.transferTo(new File(path + newFileName));
                    
                    //缩略图
                    //ImageUtil.compressPic(path, path, newFileName, samllFileName, 658, 658, true);
                    ImageUtil.cut(0, 0, 658, 658, path+newFileName, path+samllFileName);
                }
            }
        }
        
        String picDomain = ConfigUtil.getPicDomain();
        
        response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
        String callback = request.getParameter("CKEditorFuncNum");
        
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
				+ ",'" + picDomain + "article/" + dirName + "/" + samllFileName + "','')");
		out.println("</script>");
    }
}
