package com.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface UserService {

	boolean CheckEmail(String Email) throws Exception;

	boolean CheckNick(String Nick) throws Exception;

	void userReg(Map<String, Object> map) throws Exception;

	ModelAndView userLogin(HttpSession session, Map<String, Object> map) throws Exception;

}
