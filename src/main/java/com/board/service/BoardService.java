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
	 * @author	김도영
	 * @param	map 게시글 정보가 들어있는 map 
	 * @throws	Exception
	 */
	void insertBoard(Map<String, Object> map) throws Exception;

	/**
	 * @author	김도영
	 * @return	게시판 글들
	 * @throws	Exception
	 */
	Map<String, Object> getBoardList(Map<String, Object> map) throws Exception;
}
