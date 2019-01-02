package com.skycentre.cms.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.skycentre.provider.entity.Menu;
import com.skycentre.provider.service.MenuService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired  
    private Producer captchaProducer = null;  
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		return "/login";
	}
	
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Enumeration<String> em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
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
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		return "/index";
	}
	
	@RequestMapping("/top")
	public String top(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession, ModelMap modelMap) throws Exception{
		String roleId = httpSession.getAttribute("roleId").toString();
		
		List<Menu> menus = menuService.getTopMenu(Integer.parseInt( roleId ));
		modelMap.addAttribute("menus", menus);
		
		return "/top";
	}
	
	@RequestMapping("/left")
	public String left(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession, ModelMap modelMap) throws Exception{
		String menuCode = "";
		String roleId = httpSession.getAttribute("roleId").toString();
		
		if (request.getParameter("menuCode") == null){
			menuCode = "1001";
		}else{
			menuCode = request.getParameter("menuCode");
		}
				
		List<Menu> menus = menuService.getMenuByFatherId(Integer.parseInt(roleId),Integer.parseInt(menuCode));
		
		for (int i = 0; i < menus.size(); ++i){
			List<Menu> secondMenu = menuService.getMenuByFatherId(Integer.parseInt(roleId),menus.get(i).getMenuCode());
			
			menus.get(i).setSecondMenu(secondMenu);
		}
		
		modelMap.addAttribute("menus", menus);
		
		return "/left";
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession, ModelMap modelMap) throws Exception{
		String roleId = httpSession.getAttribute("roleId").toString();
		
		List<Menu> menus = menuService.getTopMenu( Integer.parseInt(roleId) );
		
		for (int i = 0; i < menus.size(); ++i){
			List<Menu> secondMenu = menuService.getMenuByFatherId(Integer.parseInt(roleId),menus.get(i).getMenuCode());
			
			menus.get(i).setSecondMenu(secondMenu);
		}
		
		modelMap.addAttribute("menus", menus);
		
		String username = httpSession.getAttribute("username").toString();
		modelMap.addAttribute("truename", username);
		
		return "/main";
	}
	
	@RequestMapping(value = "captcha-image")  
    public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) throws Exception {  
        HttpSession session = request.getSession();  
          
        response.setDateHeader("Expires", 0);  
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
        response.setHeader("Pragma", "no-cache");  
        response.setContentType("image/jpeg");  
        
        String capText = captchaProducer.createText();  
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);  
        
        BufferedImage bi = captchaProducer.createImage(capText);  
        ServletOutputStream out = response.getOutputStream();  
        ImageIO.write(bi, "jpg", out);  
        try {  
            out.flush();  
        } finally {  
            out.close();  
        }  
        return null;  
    }
}
