package com.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.board.dao.CommentDAO;

@Service(value="CommentService")
public class CommentServiceImpl implements CommentService{
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="CommentDAO")
	private CommentDAO commentDAO;
	
	@Override
	
	public List<Map<String, Object>> commentSelect(Map<String, Object> map) throws Exception {
		return commentDAO.commentSelect(map);
	}
	
	@Override
	public void commentWrite(Map<String, Object> map) throws Exception {
		// 태그 사용 방지
		map.put("CONTENTS", map.get("CONTENTS").toString().replaceAll("<", "&lt"));
		map.put("CONTENTS", map.get("CONTENTS").toString().replaceAll("\n", "<br/>"));
		
		commentDAO.commentWrite(map);
	}
	
	@Override
	public void commentUpdate(Map<String, Object> map) throws Exception {
		// 태그 사용 방지
		map.put("CONTENTS", map.get("CONTENTS").toString().replaceAll("<", "&lt"));
		map.put("CONTENTS", map.get("CONTENTS").toString().replaceAll("\n", "<br/>"));
		
		commentDAO.commentUpdate(map);
	}
	
	@Override
	public void commentDelete(Map<String, Object> map) throws Exception {
		commentDAO.commentDelete(map);
	}
}
