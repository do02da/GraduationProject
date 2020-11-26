package com.user.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.user.dao.UserDAO;
import com.user.utils.UserUtil;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource(name="userDAO")
	UserDAO userDAO;
	
	@Resource(name="userUtil")
	private UserUtil userUtil;
	
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
		String encode_password = userUtil.encryptPassword(map.get("EMAIL").toString(), map.get("PASSWORD").toString());
		
		map.put("PASSWORD", encode_password);
		
		userDAO.userReg(map);
	}
	
	@Override
	public ModelAndView userLogin(HttpSession session, Map<String, Object> map) throws Exception {
		ModelAndView mv = null;
		
		if ( session.getAttribute("login") != null ){
            // 기존에 login이란 세션 값이 존재한다면
            session.removeAttribute("login"); // 기존값을 제거해 준다.
        }

		Map<String, Object> UserMap = null;
		
		try {
			UserMap = userDAO.userLogin(map);	// 로그인 정보
			
			String encode_password = userUtil.encryptPassword(map.get("EMAIL").toString(), map.get("PASSWORD").toString());
			
			if (UserMap.get("PASSWORD").equals(encode_password)) {
				mv = new ModelAndView("redirect:/openAlbumBoard.do");
				
				Map<String, Object> sessionMap = new HashMap<String, Object>();
				sessionMap.put("EMAIL", UserMap.get("EMAIL"));
				sessionMap.put("NICKNAME", UserMap.get("NICKNAME"));
				session.setAttribute("login", sessionMap);
			} else {	// 비밀번호 불일치
				mv = new ModelAndView("/user/login");
				mv.addObject("error", "비밀번호가 일치하지 않습니다.");
			}

		} catch (NullPointerException e) {	// 이메일이 존재하지 않음
			mv = new ModelAndView("/user/login");
			mv.addObject("error", "아이디가 존재하지 않습니다.");
		} 
		
		return mv;
	}
}
