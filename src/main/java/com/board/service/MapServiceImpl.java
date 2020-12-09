package com.board.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.board.dao.MapDAO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service(value="MapService")
public class MapServiceImpl implements MapService {
	
	@Resource(name="mapDAO")
	private MapDAO mapDAO;
	
	
	@Override
	public List<Map<String, Object>> getItemList(Map<String, Object> map) throws Exception {
		return mapDAO.getItemList(map);
	}
	
	@Override
	public List<Map<String, Object>> getTrrst(Map<String, Object> map) throws Exception {
		return mapDAO.getTrrst(map);
	}
	
	@Override
	public void TrrstDBInsert() throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> EarlyMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> DataRecords = new ArrayList<Map<String, Object>>();
		String url;
		File jsonFile;
		
		url = "C:/dev/전국관광지정보표준데이터.json";
		
		jsonFile = new File(url);
		
		// "fields"와 "Records"로 이루어진 맵
		EarlyMap = mapper.readValue(jsonFile, new TypeReference<Map<String, Object>>(){});
		
		// EarlyMap에서 Records만 분리해서 DataRecords에 넣는다.
		DataRecords = (List<Map<String, Object>>) EarlyMap.get("records");
		
		// JSON 파일을 분리해서 resultMap에 넣고 DAO로 DB에 넣는다.
		for (Map<String, Object> data : DataRecords) {
			if (!data.get("위도").equals("")) {
				resultMap.put("trrstNm", data.get("관광지명"));
				resultMap.put("rdnmadr", data.get("소재지도로명주소"));
				resultMap.put("lnmadr", data.get("소재지지번주소"));
				resultMap.put("latitude", data.get("위도"));
				resultMap.put("longitude", data.get("경도"));
				
				mapDAO.TrrstDBInsert(resultMap);
			} else {
				continue;
			}
		}
	}

}
