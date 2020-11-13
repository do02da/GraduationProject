package com.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface UserService {

	/**
	 * 입력한 이메일이 DB에 저장되어있는지 확인한다.
	 * @Author	김도영
	 * @param	Email 사용자가 입력한 이메일값
	 * @return	이메일 중복 여부. 중복이면 false를 반환한다.
	 * @throws	Exception
	 */
	boolean CheckEmail(String Email) throws Exception;

	/**
	 * 입력한 닉네임이 DB에 저장되어있는지 확인한다.
	 * @Author	김도영
	 * @param	Nick 사용자가 입력한 닉네임값
	 * @return	닉네임 중복 여부. 중복이면 false를 반환한다.
	 * @throws	Exception
	 */
	boolean CheckNick(String Nick) throws Exception;

	/**
	 * 사용자가 입력한 폼으로 회원가입을 한다.
	 * @Author	김도영
	 * @param	map 사용자가 입력한 이메일, 닉네임, 비밀번호가 들어있는 map
	 * @throws	Exception
	 */
	void userReg(Map<String, Object> map) throws Exception;

	/**
	 * DB에 저장되어있는 아이디와 비밀번호와 맞는지 확인하여 로그인한다.
	 * @Author	김도영
	 * @param	session 로그인되어있는지 확인하기 위한 세션
	 * @param	map 사용자가 입력한 이메일과 비밀번호가 들어있는 map
	 * @return	첫 화면
	 * @throws	Exception
	 */
	ModelAndView userLogin(HttpSession session, Map<String, Object> map) throws Exception;

}
