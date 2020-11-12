package com.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.service.BoardService;

@Controller
public class BoardController {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="boardService")
	BoardService boardService;
	
	String fileDir = "C:\\upload\\";
	// https://mine-it-record.tistory.com/277?category=1060192
	
	
	/**
	 * @param request
	 * @param response
     * @param multiFile
     * @param upload
     * @return void
     * @throws Exception
     */
	@RequestMapping(value="/board/imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception {
		boardService.imageUpload(request, response, multiFile, upload);
    }
	
	/**
     * cKeditor 서버로 전송된 이미지 뿌려주기
     * @param uid
     * @param fileName
     * @param request
     * @param response
     * @return void
     * @throws Exception
     */
    //
    @RequestMapping(value="/board/ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
                       , @RequestParam(value="fileName") String fileName
                       , HttpServletRequest request, HttpServletResponse response) throws Exception {
    	boardService.ckSubmit(uid, fileName, request, response);
    }
}
