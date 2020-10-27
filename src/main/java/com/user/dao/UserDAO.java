package com.user.dao;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	// 중복 확인
	// count가 0보다 크면 중복이므로 false
	public boolean CheckEmail(String Email) throws Exception {
		return selectOne("user.CheckEmail", Email) > 0 ? false : true;
	}

	public boolean CheckNick(String Nick) throws Exception {
		return selectOne("user.CheckNick", Nick) > 0 ? false : true;
	}
	// 중복 확인 끝
	
	public void userReg(Map<String, Object> map) throws Exception {
		insert("user.userReg", map);
	}
}
