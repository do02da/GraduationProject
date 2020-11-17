package com.board.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	/**
	 * 작성한 게시글을 DB에 저장한다.
	 * @author	김도영
	 * @param	
	 * @throws	Exception
	 */
	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("board.insertBoard", map);
	}
}
