package com.user.service;

import java.util.Map;

public interface UserService {

	boolean CheckEmail(String Email) throws Exception;

	boolean CheckNick(String Nick) throws Exception;

	void userReg(Map<String, Object> map) throws Exception;

}
