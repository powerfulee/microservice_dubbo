package com.skycentre.cms.util;

import java.io.File;

public class StringUtil {
	private StringUtil() {
	}

	public static String nullToString(String value) {
		return value == null ? "" : value.trim().toString();
	}

	public static String nullToString2(String value) {
		return value == null ? "" : value.toString();
	}

	public static int nullToInteger(String value) {
		int ret = 0;
		try {
			ret = (value == null) ? null : Integer.parseInt(value.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public static int nullToInteger(String value, int def) {
		int ret = def;
		try {
			ret = (value == null) ? def : Integer.parseInt(value.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public static Long nullToLong(String value) {
		long ret = 0;
		try {
			ret = (value == null) ? null : Long.parseLong(value.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public static Long nullToLong(String value, Long def) {
		long ret = def;
		try {
			ret = (value == null) ? def : Long.parseLong(value.trim());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	// 创建目录
	public static boolean createDir(String destDirName) {
		File dir = new File(destDirName);
		if (dir.exists()) {// 判断目录是否存在
			System.out.println("创建目录失败，目标目录已存在！");
			return false;
		}
		if (!destDirName.endsWith(File.separator)) {// 结尾是否以"/"结束
			destDirName = destDirName + File.separator;
		}
		if (dir.mkdirs()) {// 创建目标目录
			System.out.println("创建目录成功！" + destDirName);
			return true;
		} else {
			System.out.println("创建目录失败！");
			return false;
		}
	}
}
