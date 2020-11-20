package com.board.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	public Map<String, Object> getBestBoardList() throws Exception {
		return boardDAO.getBestBoardList();
	}
	
	@Override
	public Map<String, Object> getBoardList() throws Exception {
		return boardDAO.getBoardList();
	}
	
	@Override
	public void up_Hit_Cnt(Map<String, Object> map) throws Exception {
		boardDAO.up_Hit_Cnt(map);
	}
	
	@Override
	public Map<String, Object> getBoardDetail(Map<String, Object> map) throws Exception {
		return boardDAO.getBoardDetail(map);
	}
	
	// 좋아요 부분
	@Override
	public void LikeIt(Map<String, Object> map) throws Exception {
		if (isLikePeople(map)) {				// 좋아요 여부 확인
			boardDAO.InsertLikePeople(map);
		} else {
			return;
		}
	}
	
	@Override
	public void DisLikeIt(Map<String, Object> map) throws Exception {
		if (!isLikePeople(map)) {
			boardDAO.DeleteLikePeople(map);
		} else {
			return;
		}
	}
	
	@Override
	public boolean isLikePeople(Map<String, Object> map) throws Exception {
		if (boardDAO.CheckLikePeople(map) > 0) {
			return false;
		} else {
			return true;
		}
	}
	// 
	
	@Override
	public Map<String, Object> uploadSummernoteImageFile(MultipartFile multipartFile) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String fileRoot = "\\summernote_image\\";											// 저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();						// 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	// 파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;								// 저장될 파일 명
		
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
		Pattern pattern = Pattern.compile(".*<img.*>");	// 이미지 있는지 확인하는 정규표현식
		String contents = (String) map.get("contents");	// 게시글 내용을 String으로 가져온다
		Matcher matcher = pattern.matcher(contents);	// 게시글 내용과 정규표현식
		String target = "/summernoteImage/";			// 이미지 경로 시작부분

		
		if (matcher.find()) {							// 글에 사진이 있으면
			int target_num = contents.indexOf(target);	// 일치하는 첫 번째 사진의 시작위치를 가져온다.
			
			String result = contents.substring(target_num, (contents.substring(target_num).indexOf("\"") + target_num));
			
			map.put("thumbnail", result);
		} else {										// 글에 사진이 없으면
			map.put("thumbnail", "");					// thumbnail을 빈 값으로 한다.
		}

		boardDAO.insertBoard(map);
	}
}
