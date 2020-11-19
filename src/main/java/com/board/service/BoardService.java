package com.board.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	
	/**
	 * 파일을 서버에 저장하고 저장된 URL을 반환한다.
	 * @author	김도영
	 * @param	multipartFile
	 * @return	파일 URL
	 * @throws	Exception
	 */
	Map<String, Object> uploadSummernoteImageFile(MultipartFile multipartFile) throws Exception;

	/**
	 * 게시글을 DB에 저장
	 * @author	김도영
	 * @param	map 게시글 정보가 들어있는 map 
	 * @throws	Exception
	 */
	void insertBoard(Map<String, Object> map) throws Exception;

	/**
	 * 게시글들을 가져온다
	 * @author	김도영
	 * @return	게시판 글들
	 * @throws	Exception
	 */
	Map<String, Object> getBoardList() throws Exception;

	/**
	 * 게시글 상세보기하면 조회수를 1 올린다.
	 * @author	김도영
	 * @param	map 게시글
	 * @throws	Exception
	 */
	void up_Hit_Cnt(Map<String, Object> map) throws Exception;

	/**
	 * 게시글 상세 내용을 가져온다
	 * @author	김도영
	 * @param	map 게시글 ID가 들어있는 map
	 * @return	게시글 상세내용
	 * @throws	Exception
	 */
	Map<String, Object> getBoardDetail(Map<String, Object> map) throws Exception;
}
