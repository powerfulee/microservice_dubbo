package com.skycentre.provider.service;

import com.skycentre.provider.entity.BlogLog;
import com.skycentre.provider.entity.Logs;

public interface LogService {
	int insert(Logs log);
	
	int minsert(BlogLog bl);
}
