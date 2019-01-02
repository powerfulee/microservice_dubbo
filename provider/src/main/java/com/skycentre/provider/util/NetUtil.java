package com.skycentre.provider.util;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

public class NetUtil {
	public static String getRemoteStream(HttpServletRequest request) throws Exception {
		String x = "";
		try {
			//PrintWriter out = response.getWriter();
			InputStreamReader reader = new InputStreamReader(request.getInputStream(), "UTF-8");
			char[] buff = new char[1024];
			int length = 0;
			while ((length = reader.read(buff)) != -1) {
				x = new String(buff, 0, length);
				// System.out.println(x);
				// out.print(x);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return x;
	}
}
