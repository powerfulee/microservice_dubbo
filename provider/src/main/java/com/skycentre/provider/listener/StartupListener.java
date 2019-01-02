package com.skycentre.provider.listener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.codehaus.jackson.map.ObjectMapper;
import org.elasticsearch.client.Client;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.web.context.ServletContextAware;

import com.skycentre.provider.entity.Blog;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.entity.Reply;
import com.skycentre.provider.service.BlogService;
import com.skycentre.provider.service.CategoryService;
import com.skycentre.provider.service.ReplyService;
import com.skycentre.provider.util.ElasticSearchUtil;
import com.skycentre.provider.util.JedisUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Pipeline;

public class StartupListener implements ApplicationContextAware, ServletContextAware, InitializingBean,
		ApplicationListener<ContextRefreshedEvent> {

	private static Logger logger = LoggerFactory.getLogger(StartupListener.class);
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ReplyService replyService;
	
	@Override  
    public void setApplicationContext(ApplicationContext ctx) throws BeansException {  
		logger.debug("初始化redis");
        initRedis();
        
		logger.debug("初始化ElasticSearch");  
        initEs();
    }  
   
    @Override  
    public void setServletContext(ServletContext context) {  
        logger.debug("2 => StartupListener.setServletContext");  
    }  
   
    @Override  
    public void afterPropertiesSet() throws Exception {  
        logger.debug("3 => StartupListener.afterPropertiesSet");  
    }  
   
    @Override  
    public void onApplicationEvent(ContextRefreshedEvent evt) {  
        logger.debug("4.1 => MyApplicationListener.onApplicationEvent");  
        if (evt.getApplicationContext().getParent() == null) {  
            logger.debug("4.2 => MyApplicationListener.onApplicationEvent");  
        }  
    }
    
    public void initEs(){
        ObjectMapper mapper = null;
		mapper = new ObjectMapper();
		
        try{
        	Client client = ElasticSearchUtil.connectEs();
        	ElasticSearchUtil.delIndex("blog_index");
        	
        	Integer total = blogService.getCount();
            List<Blog> blogs = blogService.getList(0, total);
            
        	for (Blog blog : blogs){
        		String jsonValue = mapper.writeValueAsString(blog);
        		ElasticSearchUtil.insertDocument(client, jsonValue, "blog_index", "blog_info", blog.getId().toString());
        	}
        }catch(Exception ex){
        	ex.printStackTrace();
        }
    }
    
    public void initRedis(){
    	Jedis jedis = JedisUtil.getInstance().getJedis();
    	
    	Pipeline p = jedis.pipelined();
    	
    	if (jedis.exists("skycentre:blog:list")){
    		jedis.del("skycentre:blog:list");
    	}
    	
    	List<Category> categories = categoryService.getList();
    	for (Category category : categories){
    		if (jedis.exists("skycentre:blog:category:" + category.getCategoryName())){
        		jedis.del("skycentre:blog:category:" + category.getCategoryName());
        	}
    	}
    	
    	if (jedis.exists("skycentre:blog:list:ids")){
    		jedis.del("skycentre:blog:list:ids");
    	}
    	
    	//初始化blog
    	Integer total = blogService.getCount();
        List<Blog> blogs = blogService.getList(0, total);
        
	    for (Blog blog: blogs){
	    	p.hset("skycentre:blog:list", blog.getId() + "", Json.toJson(blog, JsonFormat.compact()));
	    	
	    	jedis.zadd("skycentre:blog:list:ids", blog.getCreateDate(), blog.getId().toString());
	    	
	    	//初始化博客评论
	    	List<Reply> replies = replyService.getListByBlog(blog.getId());
	    	Map<String, String> map = new HashMap<String, String>();
	    	for (Reply reply : replies){
	    		map.put(reply.getId().toString(), Json.toJson(reply, JsonFormat.compact()));
	    	}
	    	if (!map.isEmpty()){
	    		p.hmset("skycentre:blog:reply:" + blog.getId(), map);
	    	}
	    	p.sync();
	    }
	    
	    //初始化category
	    for (Category category : categories){
	    	int blogCount = blogService.getCountByCategory(category.getId());
	    	List<Blog> blogList = blogService.getListByCategory(category.getId(), 0, blogCount);
	    	
	    	for (Blog blog : blogList){
	    		jedis.zadd("skycentre:blog:category:" + category.getCategoryName(),blog.getCreateDate(),blog.getId().toString());
	    	}
	    }
	    
    	p.sync();
    }
}
