package com.skycentre.provider;

import java.io.IOException;

import org.apache.commons.logging.LogFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ServerStart implements Runnable{
	static org.apache.commons.logging.Log log = LogFactory.getLog(ServerStart.class);
	private boolean isRun;
	
	public ServerStart() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
		isRun = true;
		context.start();
		log.info("server starting...");
	}
	
	public void run() {
		// 轮询选择器选择键
		while (isRun) {
			
		}
	}
	
	public static void main(String[] args) throws IOException {
		ServerStart s = new ServerStart();
		new Thread(s).start();
	}
}
