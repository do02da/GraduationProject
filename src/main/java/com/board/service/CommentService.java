package com.board.service;

import java.util.List;
import java.util.Map;

public interface CommentService {
	List<Map<String, Object>> commentSelect(Map<String, Object> map) throws Exception;
	
	void commentWrite(Map<String, Object> map) throws Exception;

	void commentUpdate(Map<String, Object> map) throws Exception;

	void commentDelete(Map<String, Object> map) throws Exception;
}
