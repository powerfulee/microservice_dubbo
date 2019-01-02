package com.skycentre.cms.util;

import java.io.File;
import java.io.FileNotFoundException;

public class ConfigUtil {
	// 行分隔符
		static final public String LINE_SEPARATOR = System.getProperty("line.separator");

	    // 配置根节点
	    static private org.dom4j.Document root = null;
	    // 访问目录
	    static private String uploadPath = null;
	    // 上传目录
	    static private String picDomain = null;
	    
	    static {
			String filePath = null;
			String os_name = System.getProperty("os.name");
			if (os_name.indexOf("Windows") != -1) {
				filePath = "/etc/blog/config.xml";
			}else{
				filePath = "/etc/blog/config.xml";
			}
			try{
				File configFile = new File(filePath);
				if (configFile.exists()){
					root = XmlUtil.parseXml(configFile);
				}
			}catch (FileNotFoundException e){
				System.out.println("=========配置文件没有发现！=========");
				e.printStackTrace();
			}catch (SecurityException e){
				System.out.println("=========没有访问文件的权限！=========");
				e.printStackTrace();
			}catch (Exception e){
				e.printStackTrace();
			}
			uploadPath = XmlUtil.getString(root, "/config/system/uploadPath");
			picDomain = XmlUtil.getString(root, "/config/system/picDomain");
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
	    public static int getIntValue(String xql ,int defValue) {
	        return XmlUtil.getInt(root, xql ,defValue);
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
}
