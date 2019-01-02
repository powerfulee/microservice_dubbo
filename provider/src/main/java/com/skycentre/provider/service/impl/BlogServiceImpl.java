package com.skycentre.provider.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;
import org.elasticsearch.action.count.CountResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.highlight.HighlightField;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycentre.provider.dao.BlogDao;
import com.skycentre.provider.dao.CategoryDao;
import com.skycentre.provider.entity.Blog;
import com.skycentre.provider.entity.Category;
import com.skycentre.provider.service.BlogService;
import com.skycentre.provider.util.DateUtil;
import com.skycentre.provider.util.ElasticSearchUtil;
import com.skycentre.provider.util.JedisUtil;

import net.sf.json.JSONObject;
import redis.clients.jedis.Jedis;

@Service("blogService")
public class BlogServiceImpl implements BlogService {
	@Autowired
	private BlogDao blogDao;

	@Autowired
	private CategoryDao categoryDao;

	static org.apache.commons.logging.Log log = LogFactory.getLog(BlogServiceImpl.class);
	
	public List<Blog> getList(Integer offset, Integer limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("limit", limit);

		return blogDao.getList(map);
	}

	/**
	 * 返回数据给前端
	 * 
	 * @param offset
	 * @param limit
	 * @return
	 */
	public List<Blog> getListToFrontend(Integer offset, Integer limit) {
		List<Blog> blogs = new ArrayList<Blog>();

		Jedis jedis = JedisUtil.getInstance().getJedis();
		if (jedis.exists("skycentre:blog:list:ids") && jedis.exists("skycentre:blog:list")) {
			Set<String> ids = jedis.zrevrange("skycentre:blog:list:ids", (offset - 1) * limit, offset * limit - 1);
			String[] arr = ids.toArray(new String[ids.size()]);

			List<String> result = jedis.hmget("skycentre:blog:list", arr);

			ObjectMapper mapper = new ObjectMapper();
			try {
				JavaType javaType = getCollectionType(ArrayList.class, Blog.class);
				blogs = (List<Blog>) mapper.readValue(result.toString(), javaType);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("offset", (offset - 1) * limit);
			map.put("limit", limit);

			blogs = blogDao.getList(map);
		}

		return blogs;
	}

	public List<Blog> getListByCategory(Integer categoryId, Integer offset, Integer limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryId", categoryId);
		map.put("offset", offset);
		map.put("limit", limit);

		return blogDao.getListByCategory(map);
	}

	public List<Blog> getListByCategoryToFrontend(Integer categoryId, Integer offset, Integer limit) {
		List<Blog> blogs = new ArrayList<Blog>();

		Category category = categoryDao.selectByPrimaryKey(categoryId);
		String categoryName = category.getCategoryName();

		Jedis jedis = JedisUtil.getInstance().getJedis();

		String redisKeyname = "skycentre:blog:category:" + categoryName;

		if (jedis.exists(redisKeyname)) {
			Set<String> ids = jedis.zrevrange(redisKeyname, (offset - 1) * limit, offset * limit - 1);
			String[] arr = ids.toArray(new String[ids.size()]);

			List<String> result = jedis.hmget("skycentre:blog:list", arr);

			ObjectMapper mapper = new ObjectMapper();
			try {
				JavaType javaType = getCollectionType(ArrayList.class, Blog.class);
				blogs = (List<Blog>) mapper.readValue(result.toString(), javaType);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categoryId);
			map.put("offset", (offset - 1) * limit);
			map.put("limit", limit);

			blogs = blogDao.getListByCategory(map);
		}

		return blogs;
	}

	public Integer insert(Blog blog) {
		Integer result = blogDao.insert(blog);

		// 写elasticSearch
		JSONObject jsonBlog = JSONObject.fromObject(blog);
		jsonBlog.remove("createDate");
		jsonBlog.put("createDate", System.currentTimeMillis());
		ElasticSearchUtil.addDocument(jsonBlog, "blog_index", "blog_info", blog.getId().toString());

		// 写redis
		Jedis jedis = JedisUtil.getInstance().getJedis();
		jedis.hset("skycentre:blog:list", blog.getId() + "",Json.toJson(blog, JsonFormat.compact()));
		jedis.zadd("skycentre:blog:list:ids", blog.getCreateDate(), blog.getId().toString());
		jedis.zadd("skycentre:blog:category:" + blog.getCategoryName(),blog.getCreateDate(),blog.getId().toString());
		
		return result;
	}

	public Blog getBlog(Integer id) {
		Blog blog = new Blog();

		Jedis jedis = JedisUtil.getInstance().getJedis();
		if (jedis.hexists("skycentre:blog:list", id + "")) {
			String result = jedis.hget("skycentre:blog:list", id + "");
			blog = Json.fromJson(Blog.class, result);
		} else {
			blog = blogDao.selectByPrimaryKey(id);
		}

		return blog;
	}

	public Blog getBlogToNext(Integer type,Long createDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("createDate", createDate);
		
		return blogDao.getBlogToNext(map);
	}

	public Integer update(Blog blog) {
		// 移取es索引
		ElasticSearchUtil.delDocument("blog_index", "blog_info", blog.getId().toString());

		// 更新redis
		Jedis jedis = JedisUtil.getInstance().getJedis();
		Integer id = blog.getId();
		Category category = categoryDao.selectByPrimaryKey(blog.getCategoryId());
		//如果下架，删除redis
		if (blog.getStatus() == 1) {
			jedis.hdel("skycentre:blog:list", id.toString());
			jedis.zrem("skycentre:blog:list:ids", id.toString());
			jedis.zrem("skycentre:blog:category:" + category.getCategoryName(), id.toString());
		}else {
			jedis.hset("skycentre:blog:list", blog.getId() + "",Json.toJson(blog, JsonFormat.compact()));
			jedis.zadd("skycentre:blog:list:ids", blog.getCreateDate(), blog.getId().toString());
			jedis.zadd("skycentre:blog:category:" + blog.getCategoryName(),blog.getCreateDate(),blog.getId().toString());
			
			// 重建es索引
			JSONObject jsonBlog = JSONObject.fromObject(blog);
			ElasticSearchUtil.addDocument(jsonBlog, "blog_index", "blog_info", blog.getId().toString());
		}
		
		return blogDao.updateByPrimaryKeySelective(blog);
	}

	public Integer delete(Integer id) {
		// 删除elasticSearch文档
		ElasticSearchUtil.delDocument("blog_index", "blog_info", id.toString());
		
		Blog blog = blogDao.selectByPrimaryKey(id);
		Category category = categoryDao.selectByPrimaryKey(blog.getCategoryId());
		
		// 删除redis
		Jedis jedis = JedisUtil.getInstance().getJedis();
		try{
			jedis.hdel("skycentre:blog:list", id.toString());
			jedis.zrem("skycentre:blog:list:ids", id.toString());
			jedis.zrem("skycentre:blog:category:" + category.getCategoryName(), id.toString());
		}finally{
			JedisUtil.closeJedis(jedis);
		}
		
		return blogDao.deleteByPrimaryKey(id);
	}

	public List<Blog> search(Blog blog) {
		return blogDao.search(blog);
	}

	public List<Blog> search(String keyword, Integer page) {
		List<Blog> blogs = new ArrayList<Blog>();
		try {
			Client client = ElasticSearchUtil.connectEs();

			CountResponse countResponse = client.prepareCount("blog_index")
					.setQuery(QueryBuilders.matchQuery("content", keyword)).execute().actionGet();

			SearchResponse result = client.prepareSearch("blog_index", "blog_index").addHighlightedField("content")
					.setTypes("blog_info", "blog_info").setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
					.setQuery(QueryBuilders.matchQuery("content", keyword)).addHighlightedField("content")
					.setHighlighterPreTags("<font color='#ff0000'>").setHighlighterPostTags("</font>").setFrom((page - 1) * 10)
					.setSize(10).setExplain(true).execute().actionGet();
			SearchHits hits = result.getHits();

			for (SearchHit searchHit : hits) {
				Map<String, Object> source = new HashMap<String, Object>();
				Map<String, HighlightField> hl = new HashMap<String, HighlightField>();
				hl = searchHit.getHighlightFields();
				source = searchHit.getSource();
				Blog blog = (Blog) JSONObject.toBean(JSONObject.fromObject(source), Blog.class);
				
				/*StringBuilder blogContent = new StringBuilder();

				Text[] text = hl.get("content").getFragments();
				for (Text str : text) {
					blogContent.append(str);
				}*/
				Document doc = Jsoup.parse( hl.get("content").fragments()[0].toString() );
				blog.setContent(org.apache.commons.lang.StringEscapeUtils.unescapeHtml(doc.body().toString()));
				blogs.add(blog);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return blogs;
	}

	public Long getSearchCountByES(String keyword) {
		Client client = null;
		CountResponse response = null;
		try {
			client = ElasticSearchUtil.connectEs();

			response = client.prepareCount("blog_index").setQuery(QueryBuilders.matchQuery("content", keyword))
					.execute().actionGet();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return response.getCount();
	}

	public Integer getCount() {
		return blogDao.getCount();
	}

	public Integer getCountByCategory(Integer categoryId) {
		return blogDao.getCountByCategory(categoryId);
	}

	public static JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
	}
	
	public static void main(String[] args) {
		try {
			Long timestamp = Long.parseLong( DateUtil.date2TimeStamp("2006","yyyy") );
			System.out.println(timestamp);
			
			/*Client client = ElasticSearchUtil.connectEs();
	
			CountResponse countResponse = client.prepareCount("blog_index")
					.setQuery(QueryBuilders.matchQuery("content", "佛")).execute().actionGet();
	
			SearchResponse result = client.prepareSearch("blog_index", "blog_index").addHighlightedField("content")
					.setTypes("blog_info", "blog_info").setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
					.setQuery(QueryBuilders.matchQuery("content", "佛")).addHighlightedField("content")
					.setHighlighterPreTags("<font color='#ff0000'>").setHighlighterPostTags("</font>").setFrom((1 - 1) * 10)
					.setSize(10).setExplain(true).execute().actionGet();
			SearchHits hits = result.getHits();
			
			for (SearchHit searchHit : hits) {
				Map<String, Object> source = new HashMap<String, Object>();
				Map<String, HighlightField> hl = new HashMap<String, HighlightField>();
				hl = searchHit.getHighlightFields();
				source = searchHit.getSource();
				//log.info(hl.get("content").fragments()[0]);
				Document content = Jsoup.parse( hl.get("content").fragments()[0].toString() );
				log.info(hl.get("content").fragments()[0].toString());
				StringBuilder blogContent = new StringBuilder();
	
				Text[] text = hl.get("content").getFragments();
				for (Text str : text) {
					blogContent.append(str);
				}
			}*/
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Blog> getNewestBlogs(){
		return blogDao.getNewestBlogs();
	}
	
	public List<Blog> getYears(){
		return blogDao.getYears();
	}
	
	public List<Blog> getBlogsByYear(Integer year,Integer offset,Integer limit){
		Long timestamp = Long.parseLong( DateUtil.date2TimeStamp(year.toString(),"yyyy") );
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", timestamp);
		map.put("offset", (offset - 1) * limit);
		map.put("limit", limit);
		
		return blogDao.getBlogsByYear(map);
	}
	
	public Integer getCountByYear(Integer year) {
		Long timestamp = Long.parseLong( DateUtil.date2TimeStamp(year.toString(),"yyyy") );
		return blogDao.getCountByYear(timestamp);
	}
}
