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

	/**
	 * 이메일 중복 여부 확인
	 * @author	김도영
	 * @param 	Email 사용자가 입력한 이메일값
	 * @return	이메일 중복 여부. 중복이면 false 반환
	 * @throws	Exception
	 */
	@RequestMapping(value="/user/CheckEmail.do")
	@ResponseBody
	public boolean CheckEmail(@RequestParam String Email) throws Exception {
		return userService.CheckEmail(Email);
	}
	
	/**
	 * 닉네임 중복 여부 확인
	 * @author	김도영
	 * @param	Nick 사용자가 입력한 닉네임값
	 * @return	닉네임 중복 여부. 중복이면 false 반환
	 * @throws	Exception
	 */
	@RequestMapping(value="/user/CheckNick.do")
	@ResponseBody
	public boolean CheckNick(@RequestParam String Nick) throws Exception {
		return userService.CheckNick(Nick);
	}
	
	/**
	 * 회원가입
	 * @author	김도영
	 * @param	commandMap 이메일, 닉네임, 비밀번호가 들어있는 Map
	 * @return	회원가입 후 메인 화면으로 돌아간다.
	 * @throws	Exception
	 */
	@RequestMapping(value="/user/userReg.do")
	public ModelAndView userReg(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/openAlbumBoard.do");
		
		userService.userReg(commandMap.getMap());

		return mv;
	}
	
	/**
	 * 세션에 로그인한다.
	 * @param	session 현재 세션
	 * @param	commandMap 이메일과 비밀번호가 들어있는 map
	 * @return	로그인 후 메인 화면으로 돌아간다.
	 * @throws	Exception
	 */
	@RequestMapping(value="/user/userLogin.do")
	public ModelAndView userLogin(HttpSession session, CommandMap commandMap) throws Exception {
		ModelAndView mv = userService.userLogin(session, commandMap.getMap());

		return mv;
	}
	
	/**
	 * 현재 세션을 초기화하고 처음 화면을 띄워준다.
	 * @author	김도영
	 * @param	session 현재 세션
	 * @param	request 있던 화면으로 돌아가기 위해 가져온다
	 * @return	메인 화면으로 돌아간다.
	 */
	@RequestMapping(value="/user/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();	// 세션 초기화
		
		return "redirect:/openAlbumBoard.do";
	}
}
