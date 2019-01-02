package com.skycentre.cms.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String url = request.getRequestURI();
		
		if (url.indexOf("login")>=0 || url.indexOf("signin")>=0 || url.indexOf("index")>=0 || url.indexOf("captcha-image")>=0){
			return true;
		}
		
		HttpSession session = request.getSession();
		Object userId = (Object)session.getAttribute("userId");
		
		if (userId != null){
			return true;
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println("<script language=\"javascript\">");
		out.println("window.parent.location='login';");
		out.println("</script>");
		return false;
	}
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView mav)
            throws Exception {
        System.out.println("postHandle-----url = " + request.getRequestURI() + "?" + request.getQueryString());
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {
        System.out.println("afterCompletion-----url = " + request.getRequestURI() + "?" + request.getQueryString());
    }
}
