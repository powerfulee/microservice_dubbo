package com.skycentre.frontend.util;

import javax.servlet.http.HttpServletRequest;

public class HttpUtil {
	public static String getIpAddress(HttpServletRequest request) {
    	/*Enumeration paramNames = request.getHeaderNames();
		System.out.println("===========获取头信息开始===========");
	    while (paramNames.hasMoreElements()) {
	      String paramName = (String) paramNames.nextElement();
	      String paramValues = request.getHeader(paramName);
	      System.out.println(paramName+"="+paramValues);
	    }
	    System.out.println("===========获取头信息结束===========");*/
    	
		String ip = request.getHeader("x-real-ip");//获取nginx的真实ip
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("x-forwarded-for");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.equals("127.0.0.1") || ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "127.0.0.1";
		}
		if (ip.startsWith("10.")) {// 如果是10开头，那么取远程IP
			ip = request.getRemoteAddr();
		}

		if (ip.indexOf(",") != -1) {
			ip = ip.replaceAll(" ", "");
			String[] subIp = ip.split(",");
			if (ip.indexOf("127.0.0.1") != -1) {
				if (subIp.length == 2) {
					for (int i = 0; i < subIp.length; i++) {
						if (!subIp[i].equals("127.0.0.1")) {
							ip = subIp[i];
							break;
						}
					}
				}
			} else {
				if (subIp.length >= 1) {
					ip = subIp[0];
				}
			}
		}
		//System.out.println("最终获取到的ip为============>：" + ip);
		return ip;
	}
}
