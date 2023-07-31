package com.increpas.myhome;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import common.ViewPath;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		
		return ViewPath.INDEX + "index.jsp";
	}
	
	@RequestMapping("/test")
	public String test() {
		return ViewPath.INDEX + "ajax.jsp";
	}

	
	@RequestMapping(value="/ajax")
	@ResponseBody // 리턴값이 뷰정보가 아니라 페이지에 직접 전달하라는 의미.
	public Map<String,Object> ajax(@RequestBody Map<String,Object> vo) {
		//System.out.println(vo.get("password"));
		
		vo.put("id", "id");
		vo.put("password", "PW");
		
		return vo;
	}
	
	
//	@RequestMapping(value="/ajax",produces = "application/text;charset=utf8")
//	@ResponseBody // 리턴값이 뷰정보가 아니라 페이지에 직접 전달하라는 의미.
//	public String ajax(String name) {
//		System.out.println(name);
//		
//		return "오케이";
//	}
	
}


























