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

}
