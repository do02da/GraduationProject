package com.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("CommentDAO")
public class CommentDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commentSelect(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("comment.commentSelect", map);
	}
	
	public void commentWrite(Map<String, Object> map) throws Exception {
		insert("comment.commentWrite", map);
	}
	
	public void commentUpdate(Map<String, Object> map) throws Exception{
		update("comment.commentUpdate", map);
	}

	public void commentDelete(Map<String, Object> map) throws Exception{
		update("comment.commentDelete", map);
	}
}
