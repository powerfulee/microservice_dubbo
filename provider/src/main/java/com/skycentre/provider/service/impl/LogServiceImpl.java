package com.skycentre.provider.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skycentre.provider.dao.LogDao;
import com.skycentre.provider.entity.BlogLog;
import com.skycentre.provider.entity.Logs;
import com.skycentre.provider.service.LogService;

@Service("logService")
public class LogServiceImpl implements LogService{
	@Autowired
	private LogDao logDao;
	
	public int insert (Logs log){
		return logDao.insertSelective(log);
	}
	
	public int minsert (BlogLog bl){
		return logDao.insertBatch(bl.getLogs());
	}
}
