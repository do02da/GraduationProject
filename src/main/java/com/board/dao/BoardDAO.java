package com.board.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBoardList() throws Exception {
		return (Map<String, Object>)selectBoardList("board.getBoardList");
	}
	
	/**
	 * 게시글에 들어가면 조회수를 1 올린다.
	 * @param	map 게시글
	 */
	public void up_Hit_Cnt(Map<String, Object> map) {
		update("board.updateHitCnt", map);
	}
	
	/**
	 * @author	김도영
	 * @param	map 게시글 ID가 들어있는 맵
	 * @return	게시글 상세내용
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBoardDetail(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("board.getBoardDetail", map);
	}
	
	/**
	 * 작성한 게시글을 DB에 저장한다.
	 * @author	김도영
	 * @param	map 게시글
	 * @throws	Exception
	 */
	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("board.insertBoard", map);
	}
}
