package com.board.dao;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBoardList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectPagingList("board.getBoardList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBestBoardList() throws Exception {
		return (Map<String, Object>)selectBoardList("board.getBestBoardList");
	}
	
	/**
	 * 게시글에 들어가면 조회수를 1 올린다.
	 * @param	map 게시글
	 */
	public void up_Hit_Cnt(Map<String, Object> map) {
		update("board.updateHitCnt", map);
	}
	
	/**
	 * 게시글 상세 내용을 가져온다.
	 * @author	김도영
	 * @param	map 게시글 ID가 들어있는 맵
	 * @return	게시글 상세내용
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBoardDetail(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("board.getBoardDetail", map);
	}
	
	public void Delete(Map<String, Object> map) {
		update("board.delete", map);
	}
	
	/**
	 * 좋아요 중복 검사
	 * @param	NICKNAME
	 * @return	좋아요 여부
	 */
	public int CheckLikePeople(Map<String, Object> map) {
		return (Integer) selectOne("board.CheckLikePeople", map);
	}
	
	/**
	 * 좋아요
	 * @param	map
	 */
	public void InsertLikePeople(Map<String, Object> map) {
		insert("board.InsertLikePeople", map);	// 좋아요 테이블에 좋아요 추가
		update("board.Up_LikeCnt", map);		// 좋아요 증가
	}
	
	/**
	 * 좋아요 취소
	 * @param	map
	 */
	public void DeleteLikePeople(Map<String, Object> map) {
		delete("board.DeleteLikePeople", map);	// 좋아요 테이블에서 좋아요 한 사람 삭제
		update("board.Down_LikeCnt", map);		// 좋아요 감소
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
	
	/**
	 * 게시글을 수정한다.
	 * @param	map
	 * @throws	Exception
	 */
	public void UpdateBoard(Map<String, Object> map) throws Exception {
		update("board.UpdateBoard", map);
	}
}
