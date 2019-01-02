package com.skycentre.frontend.util;

import javax.servlet.http.HttpServletRequest;

public class DeviceUtil {

	/**
	 * 判断是否是苹果
	 * 
	 * @param request
	 * @return true为苹果
	 */
	public static boolean isApple(HttpServletRequest request) {
		String userAgent = request.getHeader("user-agent").toUpperCase();
		if (userAgent.contains("IOS") || userAgent.contains("IPHONE") || userAgent.contains("IPAD")
				|| userAgent.contains("MAC") || userAgent.contains("OS")) {
			return true;
		}
		return false;
	}

	public static String getSimpleUa(String userAgent) {
		if (userAgent != null && !userAgent.trim().equals("") && userAgent.contains("(") && userAgent.contains(")")) {
			int beginIndex = userAgent.indexOf("(") + 1;
			int endIndex = userAgent.indexOf(")");
			String subUa = userAgent.substring(beginIndex, endIndex).toLowerCase();
			if ((subUa.contains("linux") || subUa.contains("android")) && subUa.contains(";")) {// Android的简版UA
				String[] subUaArray = subUa.split(";");
				if (subUaArray.length >= 5) {
					return subUaArray[4];
				}
			} else if (subUa.contains("iphone") || subUa.contains("ipad") || subUa.contains("ios")
					|| subUa.contains("iph") || subUa.contains("mac")) {
				if (subUa.contains("iphone") || subUa.contains("iph")) {
					return "Iphone";
				} else if (subUa.contains("ipad")) {
					return "Ipad";
				} else {
					return "Mac";
				}
			} else if (subUa.contains("windows") || subUa.contains("ubuntu")) {
				return "PC";
			}
		}
		return "";
	}

	public static String getUaVersion(String userAgent) {
		String[] subUa = userAgent.toLowerCase().split(" ");
		for (int i = 0; i < subUa.length; i++) {
			if (subUa[i].contains("version")) {
				return subUa[i].replace("version/", "");
			}
		}
		return "2.3";
	}

	public static String getIpAddr(HttpServletRequest request) {
		/*
		 * Enumeration paramNames = request.getHeaderNames();
		 * System.out.println("===========获取头信息开始==========="); while
		 * (paramNames.hasMoreElements()) { String paramName = (String)
		 * paramNames.nextElement(); String paramValues =
		 * request.getHeader(paramName);
		 * System.out.println(paramName+"="+paramValues); }
		 * System.out.println("===========获取头信息结束===========");
		 */

		String ip = request.getHeader("x-real-ip");// 获取nginx的真实ip
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
		// System.out.println("最终获取到的ip为============>：" + ip);
		return ip;
	}

	/**
	 * 根据请求判断Web、CMWAP、CMNET
	 * 
	 * @param request
	 * @return 1=pc, 2=cmwap, 3=cmnet
	 */
	public static String getAccessStatus(HttpServletRequest request) {
		// 获取x-forwarded-for头，如果有值或者不为空则认为是代理的CMWAP
		String forwarded = request.getHeader("x-forwarded-for");
		if (forwarded != null) {
			// 记录系统日志
			return "wap";
		} else {
			String userAgent = request.getHeader("user-agent");
			if (userAgent != null) {
				userAgent = userAgent.toLowerCase();
				if ((userAgent.indexOf("msie") != -1 || userAgent.indexOf("firefox") != -1
						|| userAgent.indexOf("opera") != -1 || userAgent.indexOf("safari") != -1
						|| userAgent.indexOf("chrome") != -1 || userAgent.indexOf("comodo") != -1)
						&& (userAgent.indexOf("windows") != -1)) {
					return "pc";
				} else {
					return "net";
				}
			} else {
				return "net";
			}
		}
	}

	/**
	 * 判断是不是android、ios用户
	 * 
	 * @param userAgent
	 * @return
	 */
	public static boolean isAndroidAndIos(String userAgent) {
		String ua = userAgent.toLowerCase();
		if (ua.contains("linux") || ua.contains("android") || ua.contains("iphone") || ua.contains("ipad")
				|| ua.contains("ios") || ua.contains("iph") || ua.contains("mac")) {
			return true;
		}
		return false;
	}

	/**
	 * 获取浏览器版本信息
	 * 
	 * @Title: getBrowserName
	 * @data:2015-1-12下午05:08:49
	 * @author:wolf
	 *
	 * @param agent
	 * @return
	 */
	public static String getBrowserName(String agent) {
		if (agent.indexOf("msie 7") > 0) {
			return "ie7";
		} else if (agent.indexOf("msie 8") > 0) {
			return "ie8";
		} else if (agent.indexOf("msie 9") > 0) {
			return "ie9";
		} else if (agent.indexOf("msie 10") > 0) {
			return "ie10";
		} else if (agent.indexOf("msie") > 0) {
			return "ie";
		} else if (agent.indexOf("opera") > 0) {
			return "opera";
		} else if (agent.indexOf("opera") > 0) {
			return "opera";
		} else if (agent.indexOf("firefox") > 0) {
			return "firefox";
		} else if (agent.indexOf("webkit") > 0) {
			return "webkit";
		} else if (agent.indexOf("gecko") > 0 && agent.indexOf("rv:11") > 0) {
			return "ie11";
		} else {
			return "Others";
		}
	}
}
