package com.skycentre.provider.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycentre.provider.dao.ReplyDao;
import com.skycentre.provider.entity.Reply;
import com.skycentre.provider.service.ReplyService;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyDao replyDao;
	
	public List<Reply> getList(){
		return replyDao.getList();
	}
	
	public List<Reply> getListByBlog(Integer blogId){
		return replyDao.getListByBlog(blogId);
	}
	
	public Integer getCount(){
		return replyDao.getCount();
	}
	
	public Integer insert(Reply reply){
		return replyDao.insert(reply);
	}
	
	public Integer update(Reply reply){
		return replyDao.updateByPrimaryKeySelective(reply);
	}
	
	public List<Reply> getNewestReplies(){
		return replyDao.getNewestReplies();
	}
}
