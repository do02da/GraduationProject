package com.main.controller;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.service.MainService;

@Controller
public class MainController {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="mainService")
	MainService mainService;

	@RequestMapping(value="/menuMove.do")
	public ModelAndView menuMove(@RequestParam String go) throws Exception {
		ModelAndView mv = new ModelAndView(go);

		return mv;
	}
}
