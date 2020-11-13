package com.main.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	/**
	 * 파라미터로 jsp 경로가 적혀있는 go를 받아와 요청 화면으로 이동시킨다.
	 * @author	김도영
	 * @param	go 요청 화면
	 * @return	요청 화면으로 이동한다.
	 * @throws	Exception
	 */
	@RequestMapping(value="/menuMove.do")
	public ModelAndView menuMove(@RequestParam String go) throws Exception {
		ModelAndView mv = new ModelAndView(go);

		return mv;
	}
}
