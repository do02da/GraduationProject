package com.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {
	protected Logger log = (Logger) LogManager.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()) {
			log.debug("\t QueryId \t: " + queryId);
		}
	}
	
	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	public Object selectOne(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	public int selectOne(String queryId, String str) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, str);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectBoardList(String queryId) {
		printQueryId(queryId);
	     
	    Map<String,Object> returnMap = new HashMap<String,Object>();
	    List<Map<String,Object>> list = sqlSession.selectList(queryId);
	    
	    returnMap.put("result", list);
	    
	    return returnMap;
	}
	
}