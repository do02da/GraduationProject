package com.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.common.CommandMap;
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
	public ModelAndView userReg(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/menuMove.do?go=AlbumBoard");
		
		userService.userReg(commandMap.getMap());

		return mv;
	}
	
	@RequestMapping(value="/user/userLogin.do")
	public ModelAndView userLogin(HttpSession session, CommandMap commandMap) throws Exception {
		ModelAndView mv = userService.userLogin(session, commandMap.getMap());

		return mv;
	}
	
	@RequestMapping(value="/user/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();	// 세션 초기화
		
		return "redirect:" + request.getHeader("Referer");
	}
}
