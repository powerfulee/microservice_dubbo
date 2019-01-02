package com.skycentre.provider.service;

import java.util.List;

import com.skycentre.provider.entity.Logs;

public interface LogService {
	int insert(Logs log);
	
	int minsert(List<Logs> logs);
}
