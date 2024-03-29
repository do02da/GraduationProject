package com.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.service.MapService;
import com.common.common.CommandMap;

@Controller
public class MapController {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="MapService")
	MapService mapService;
	
	@RequestMapping(value="/map/getItemList.do")
	@ResponseBody
	public List<Map<String, Object>> getItemList(CommandMap commandMap) throws Exception {
		return mapService.getItemList(commandMap.getMap());
	}
	
	@RequestMapping(value="/map/SearchTrrst.do")
	@ResponseBody
	public List<Map<String, Object>> SearchTrrst(CommandMap commandMap) throws Exception {
		return mapService.getTrrst(commandMap.getMap());
	}
	
	@RequestMapping(value="/map/TrrstDBInsert.do")
	public void TrrstDBInsert() throws Exception {
		mapService.TrrstDBInsert();
	}
}
