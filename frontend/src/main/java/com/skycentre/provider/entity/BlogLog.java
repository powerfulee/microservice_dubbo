package com.skycentre.provider.entity;

import java.io.Serializable;
import java.util.List;

public class BlogLog implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String platform;
	
	private List<Logs> logs;

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public List<Logs> getLogs() {
		return logs;
	}

	public void setLogs(List<Logs> logs) {
		this.logs = logs;
	}
}
