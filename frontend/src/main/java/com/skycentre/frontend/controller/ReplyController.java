package com.skycentre.frontend.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skycentre.frontend.util.HttpUtil;
import com.skycentre.provider.entity.Reply;
import com.skycentre.provider.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/insert",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> put(HttpServletRequest request, 
			HttpServletResponse response, 
			@RequestParam(value = "blogId", required = true) Integer blogId,
			@RequestParam(value = "author", required = true) String author,
			@RequestParam(value = "content", required = true) String content) throws Exception{
		
		String ipAddress = HttpUtil.getIpAddress(request);
		
		Reply reply = new Reply();
		reply.setBlogId(blogId);
		reply.setAuthor(author);
		reply.setContent(content);
		reply.setIpAddress(ipAddress);
		reply.setCreateDate(System.currentTimeMillis());
		
		replyService.insert(reply);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", 0);
		map.put("message", "提交成功");
		
		return map;
	}
}
