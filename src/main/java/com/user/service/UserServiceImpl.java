package com.user.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.user.dao.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource(name="userDAO")
	UserDAO userDAO;
	
	@Override
	public boolean CheckEmail(String Email) throws Exception {
		return userDAO.CheckEmail(Email);
	}
	
	@Override
	public boolean CheckNick(String Nick) throws Exception {
		return userDAO.CheckNick(Nick);
	}
	
	@Override
	public void userReg(Map<String, Object> map) throws Exception {
		userDAO.userReg(map);
	}
}
