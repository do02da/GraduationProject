package com.user.dao;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	// 중복확인 //
	/**
	 * 입력한 이메일이 DB에 저장되어있는지 확인한다.
	 * @Author	김도영
	 * @param	Email 사용자가 입력한 이메일값
	 * @return	count가 0 보다 크면 중복이므로 false, 아니면 true return
	 * @throws	Exception
	 */
	public boolean CheckEmail(String Email) throws Exception {
		return selectOne("user.CheckEmail", Email) > 0 ? false : true;
	}

	/**
	 * 입력한 닉네임이 DB에 저장되어있는지 확인한다.
	 * @Author	김도영
	 * @param	Nick 사용자가 입력한 닉네임값
	 * @return	count가 0 보다 크면 중복이므로 false, 아니면 true return
	 * @throws	Exception
	 */
	public boolean CheckNick(String Nick) throws Exception {
		return selectOne("user.CheckNick", Nick) > 0 ? false : true;
	}
	// 중복확인 끝 // 
	
	/**
	 * 회원가입 / 이메일, 닉네임, 비밀번호를 DB에 저장한다.
	 * @author	김도영
	 * @param	사용자가 입력한 이메일, 닉네임, 비밀번호가 들어있는 map
	 * @throws	Exception
	 */
	public void userReg(Map<String, Object> map) throws Exception {
		insert("user.userReg", map);
		logger.debug("TEST");
	}

	/**
	 * 로그인 / 이메일과 일치하는 컬럼을 가져온다.
	 * @author	김도영
	 * @param	사용자가 입력한 이메일, 비밀번호가 들어있는 map
	 * @return	이메일이 일치하는 컬럼에서 이메일과 닉네임과 패스워드를 가져와 반환한다.
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> userLogin(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("user.userLogin", map);
	}
}
