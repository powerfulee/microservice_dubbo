package com.skycentre.provider.dao;

import java.util.List;

import com.skycentre.provider.entity.Reply;

public interface ReplyDao {
	List<Reply> getList();
	
	List<Reply> getListByBlog(Integer blogId);
	
	Integer getCount();
	
    int deleteByPrimaryKey(Integer id);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKeyWithBLOBs(Reply record);

    int updateByPrimaryKey(Reply record);
    
    List<Reply> getNewestReplies();
}