package com.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("mapDAO")
public class MapDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getItemList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("map.getItemList", map);
	}
	
	/**
	 * 검색단어가 들어있는 관광지를 가져온다
	 * @param	map 검색단어
	 * @return	관광지
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getTrrst(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("map.getTrrst", map); 
	}
	
	/**
	 * 데이터베이스에 관광지 데이터를 넣는다.
	 * @param	map 관광지 데이터
	 */
	public void TrrstDBInsert(Map<String, Object> map) {
		insert("map.TrrstDBInsert", map);
	}

}
