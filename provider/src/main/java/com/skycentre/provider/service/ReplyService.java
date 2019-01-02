package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.Reply;

public interface ReplyService {
	List<Reply> getList();
	
	List<Reply> getListByBlog(Integer blogId);
	
	Integer getCount();
	
	Integer insert(Reply reply);
	
	Integer update(Reply reply);
	
	List<Reply> getNewestReplies();
}
