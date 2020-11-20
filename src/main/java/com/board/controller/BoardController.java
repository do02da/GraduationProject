package com.board.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.BoardService;
import com.common.common.CommandMap;

@Controller
public class BoardController {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="boardService")
	BoardService boardService;
	
	@RequestMapping(value="/openAlbumBoard.do")
	public ModelAndView openBestBoard() throws Exception {
		ModelAndView mv = new ModelAndView("/AlbumBoard");
		
		Map<String, Object> resultMap = boardService.getBestBoardList();
		logger.debug(resultMap);
		mv.addObject("list", resultMap.get("result"));
		logger.debug("list");
		return mv;
	}
	
	/**
	 * DB에서 게시글 목록을 가져와 게시판으로 보여준다
	 * @author	김도영
	 * @return	게시판
	 * @throws	Exception
	 */
	@RequestMapping(value="/board/openBoard.do")
	public ModelAndView openBoard() throws Exception {
		ModelAndView mv = new ModelAndView("/board/BoardMain");
		
		Map<String, Object> resultMap = boardService.getBoardList();
		
		mv.addObject("list", resultMap.get("result"));
		return mv;
	}
	
	/**
	 * 글쓰기 화면으로 이동
	 * @author	김도영
	 * @return	글쓰기 화면
	 * @throws	Exception
	 */
	@RequestMapping(value="/board/openWritePage.do")
	public ModelAndView openWritePage() throws Exception {
		ModelAndView mv = new ModelAndView("/board/writePage");
	
		return mv;
	}
	
	/**
	 * 글 상세보기 조회수를 1 올리고 게시글을 가져와서 게시글 상세보기로 뿌려준다.
	 * @author	김도영
	 * @param	commandMap
	 * @return	게시글 상세화면
	 * @throws	Exception
	 */
	@RequestMapping(value="/board/openBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/board/BoardDetail");
		Map<String, Object> map = commandMap.getMap();
		Map<String, Object> boardMap = boardService.getBoardDetail(map);

		if (map.containsKey("NICKNAME")) {	// 로그인 했으면
			mv.addObject("isLike", boardService.isLikePeople(map));
		} else {							// 비로그인 경우
			mv.addObject("isLike", "true");
		}
		
		boardService.up_Hit_Cnt(map);
		mv.addObject("map", boardMap);
		
		return mv;
	}
	
	@RequestMapping(value="/board/LikeIt.do")
	public ModelAndView likeit(HttpServletRequest request, CommandMap commandMap) throws Exception {
		Map<String, Object> map = commandMap.getMap();
		map.put("NICKNAME", request.getAttribute("NICKNAME"));	// 로그인 정보
		
		boardService.LikeIt(map);
		
		return openBoardDetail(commandMap);
	}
	
	@RequestMapping(value="/board/DisLikeIt.do")
	public ModelAndView Dislikeit(HttpServletRequest request, CommandMap commandMap) throws Exception {
		Map<String, Object> map = commandMap.getMap();
		map.put("NICKNAME", request.getAttribute("NICKNAME"));	// 로그인 정보
		
		boardService.DisLikeIt(map);
		
		return openBoardDetail(commandMap);
	}
	 /**
	 * 네비게이션바에서 map을 눌렀을 때 이동
	 * @author	박건우
	 * @return	지도 화면으로 이동
	 * @throws	Exception
	 */
	@RequestMapping(value="/board/openMap.do")
	public ModelAndView openMap() throws Exception {
		ModelAndView mv = new ModelAndView("/boad/Map");
		
		return mv;
	}
	
	/**
	 * SummerNote에서 이미지 파일을 업로드하면 서버에 저장하고 URL을 가져와서 매핑된다.
	 * @author	김도영
	 * @param	multipartFile
	 * @return	파일 URL
	 * @throws	Exception
	 */
	@RequestMapping(value="/board/uploadImage.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		return boardService.uploadSummernoteImageFile(multipartFile);
	}
	
	/**
	 * 글 작성 후 게시판 목록으로 돌아간다.
	 * @param	commandMap 제목, 작성자, 내용이 들어이는 map
	 * @throws	Exception
	 */
	@RequestMapping(value="/board/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception {
		boardService.insertBoard(commandMap.getMap());
	
		return openBoard();
	}
}
