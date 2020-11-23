package com.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.service.CommentService;
import com.common.common.CommandMap;

@Controller
public class CommentController {
	Logger log = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="CommentService")
	private CommentService commentService;
	
	@RequestMapping(value="/comment/commentList.do")
	@ResponseBody
	public List<Map<String, Object>> commentList(CommandMap commandMap) throws Exception {
		List<Map<String, Object>> commentMap = commentService.commentSelect(commandMap.getMap());
		
		return commentMap;
	}
	
	@RequestMapping(value="/comment/commentWrite.do")
	@ResponseBody
	public void commentWrite(CommandMap commandMap) throws Exception {
		commentService.commentWrite(commandMap.getMap());
	}
	
	@RequestMapping(value="/comment/commentUpdate.do")
	@ResponseBody
	public void commentUpdate(CommandMap commandMap) throws Exception {
		commentService.commentUpdate(commandMap.getMap());
	}
	
	@RequestMapping(value="/comment/commentDelete.do")
	@ResponseBody
	public void commentDelete(CommandMap commandMap) throws Exception {
		commentService.commentDelete(commandMap.getMap());
	}
}
