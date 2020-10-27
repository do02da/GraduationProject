package com.user.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.user.service.UserService;

@Controller
public class UserController {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="userService")
	UserService userService;

	@RequestMapping(value="/user/CheckEmail.do")
	@ResponseBody
	public boolean CheckEmail(@RequestParam String Email) throws Exception {
		return userService.CheckEmail(Email);
	}
	
	@RequestMapping(value="/user/CheckNick.do")
	@ResponseBody
	public boolean CheckNick(@RequestParam String Nick) throws Exception {
		return userService.CheckNick(Nick);
	}
	
	@RequestMapping(value="/user/userReg.do")
	public ModelAndView userReg(Map<String, Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/menuMove.do?go=AlbumBoard");
		logger.debug(map);
		// userService.userReg(map);
		
		return mv;
	}
}
