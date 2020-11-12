package com.board.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {

	void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile,
			MultipartFile upload) throws Exception;

	void ckSubmit(String uid, String fileName, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;

}
