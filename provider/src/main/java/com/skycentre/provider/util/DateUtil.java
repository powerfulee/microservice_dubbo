package com.skycentre.provider.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
	private static SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
	private static SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy.MM.dd");
	private static SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy年MM月dd日");
	private static SimpleDateFormat sdf5 = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat sdf6 = new SimpleDateFormat("yyyyMMdd");

	public static long getDiffTime(String startTime) {
		long min = 0;
		try {
			if (!startTime.equals("")) {
				Date d1 = new Date();
				Date d2 = sdf.parse(startTime);
				long seconds = (d1.getTime() - d2.getTime()) / 1000;// 除以1000是为了转换成秒
				min = seconds / 60;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return min;
	}

	public static String getCurrentToDate() {
		String sDate = sdf.format(new Date());
		return sDate;
	}

	public static String getCurrentDate() {
		String sDate = sdf3.format(new Date());
		return sDate;
	}

	public static String getCurTime() {
		String sDate = sdf2.format(new Date());
		return sDate;
	}

	public static Date getDateByString(String s) {
		try {
			Date date1 = sdf.parse(s);
			return date1;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getTime() {
		String sDate = sdf1.format(new Date());
		return sDate;
	}

	public static long getCurrentTime() {
		String sDate = sdf1.format(new Date());
		return Long.parseLong(sDate);
	}

	public static String getOneHoursAgoTime() {
		String oneHoursAgoTime = "";
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR, cal.get(Calendar.HOUR) - 1);
		oneHoursAgoTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cal.getTime());
		return oneHoursAgoTime;
	}

	public static String timeStamp2Date(long timestamp) {
		Long times = timestamp * 1000;
		String date = sdf2.format(new Date(times));
		return date;
	}

	public static String systime() {
		String date = sdf2.format(new Date());
		return date;
	}

	public static String timeStampToDate(String timestamp) {
		String date = sdf4.format(new Date(Long.parseLong(timestamp)));
		return date;
	}

	public static String getCurrentDateTime() {
		String sDate = sdf5.format(new Date());
		return sDate;
	}

	public static String getSysDate() {
		String sDate = sdf6.format(new Date());
		return sDate;
	}

	/**
	 * 设置指定时间
	 * 
	 * @param firstTime
	 *            hh:mm:ss
	 * @return
	 */
	public static Date setDateTime(String firstTime) {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		/*** 定制每日时间点执行方法 ***/
		String[] subTime = firstTime.split(":");
		int hours = Integer.parseInt(subTime[0]);
		int minutes = Integer.parseInt(subTime[1]);
		int seconds = Integer.parseInt(subTime[2]);
		calendar.set(year, month, day, hours, minutes, seconds);
		Date date = calendar.getTime();
		return date;
	}

	/**
	 * 获得当前日期的前一天
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getSpecifiedDayBefore() {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = sdf6.parse(getSysDate());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day - 1);

		String dayBefore = sdf6.format(c.getTime());
		return dayBefore;
	}

	/**
	 * 日期格式字符串转换成时间戳
	 * 
	 * @param date
	 *            字符串日期
	 * @param format
	 *            如：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String date2TimeStamp(String date_str, String format) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return String.valueOf(sdf.parse(date_str).getTime() /1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public static void main(String[] args) {
		// System.out.println(timeStampToDate("1365646922000"));
		//getDiffTime("2013-12-19 09:00:00");
		//System.out.println( date2TimeStamp("2006","yyyy") );
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			System.out.println(sdf.parse("2006").getTime()/1000);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
