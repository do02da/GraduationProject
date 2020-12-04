package com.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.board.dao.MapDAO;

@Service(value="MapService")
public class MapServiceImpl implements MapService {
	
	@Resource(name="mapDAO")
	private MapDAO mapDAO;
	
	
	@Override
	public List<Map<String, Object>> getItemList(Map<String, Object> map) throws Exception {
		return mapDAO.getItemList(map);
	}

}
