package com.skycentre.provider.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import redis.clients.jedis.Jedis;

public class ConfigUtil {
	// 行分隔符
	static final public String LINE_SEPARATOR = System.getProperty("line.separator");

	// 配置根节点
	static private org.dom4j.Document root = null;
	// 图片上传路径
	static private String uploadPath = null;
	// 图片访问前缀
	static private String picDomain = null;
	// redis地址
	static private String redisIpAddress = null;
	// redis密码
	static private String redisPassword = null;
	// elasticSearch地址
	static private String esIpAddress = null;
	// elasticSearch端口
	static private int esPort = 0;
	
	static {
		String filePath = null;
		String os_name = System.getProperty("os.name");
		if (os_name.indexOf("Windows") != -1) {
			filePath = "c:/etc/blog/config.xml";
		} else {
			filePath = "/etc/blog/config.xml";
		}
		try {
			File configFile = new File(filePath);
			if (configFile.exists()) {
				root = XmlUtil.parseXml(configFile);
			}
		} catch (FileNotFoundException e) {
			System.out.println("=========配置文件没有发现！=========");
			e.printStackTrace();
		} catch (SecurityException e) {
			System.out.println("=========没有访问文件的权限！=========");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		uploadPath = XmlUtil.getString(root, "/config/system/uploadPath");
		picDomain = XmlUtil.getString(root, "/config/system/picDomain");
		redisIpAddress = XmlUtil.getString(root, "/config/redis/ipAddress");
		redisPassword = XmlUtil.getString(root, "/config/redis/password");
		esIpAddress = XmlUtil.getString(root, "/config/elasticSearch/ipAddress");
		esPort = XmlUtil.getInt(root, "/config/elasticSearch/port",9300);
	}

	/**
	 * 私有构造方法，不可实例化
	 */
	private ConfigUtil() {
	}

	/**
	 * @return 返回 。
	 */
	public static String getValue(String xql) {
		return XmlUtil.getString(root, xql);
	}

	/**
	 * @return 返回 。
	 */
	public static int getIntValue(String xql, int defValue) {
		return XmlUtil.getInt(root, xql, defValue);
	}

	public static String getUploadPath() {
		return uploadPath;
	}

	public static void setUploadPath(String uploadPath) {
		ConfigUtil.uploadPath = uploadPath;
	}

	public static String getPicDomain() {
		return picDomain;
	}

	public static void setPicDomain(String picDomain) {
		ConfigUtil.picDomain = picDomain;
	}

	public static String getRedisIpAddress() {
		return redisIpAddress;
	}

	public static void setRedisIpAddress(String redisIpAddress) {
		ConfigUtil.redisIpAddress = redisIpAddress;
	}

	public static String getRedisPassword() {
		return redisPassword;
	}

	public static void setRedisPassword(String redisPassword) {
		ConfigUtil.redisPassword = redisPassword;
	}

	public static String getEsIpAddress() {
		return esIpAddress;
	}

	public static void setEsIpAddress(String esIpAddress) {
		ConfigUtil.esIpAddress = esIpAddress;
	}

	public static int getEsPort() {
		return esPort;
	}

	public static void setEsPort(int esPort) {
		ConfigUtil.esPort = esPort;
	}
	
	public static void main(String[] args){
		Jedis jedis = JedisUtil.getInstance().getJedis();
		jedis.zrem("skycentre:blog:list:ids", "261");
	}
}
