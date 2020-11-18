package com.board.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	BoardDAO boardDAO;
	
	@Override
	public Map<String, Object> getBoardList() throws Exception {
		return boardDAO.getBoardList();
	}
	
	@Override
	public Map<String, Object> uploadSummernoteImageFile(MultipartFile multipartFile) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			resultMap.put("url", "/summernoteImage/" + savedFileName);
			resultMap.put("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			resultMap.put("responseCode", "error");
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		logger.debug(map);
		boardDAO.insertBoard(map);
	}
}
