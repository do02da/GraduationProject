package com.board.service;

import java.util.List;
import java.util.Map;

public interface MapService {

	List<Map<String, Object>> getItemList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> getTrrst(Map<String, Object> map) throws Exception;

	/**
	 * 관광지 정보를 데이터베이스에 넣는다.
	 * @throws Exception
	 */
	void TrrstDBInsert() throws Exception;
}
