package com.baseballtalk.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baseballtalk.frontcontroller.Command;
import com.baseballtalk.model.Board;
import com.baseballtalk.model.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 파일 업로드를 위한 변수 설정
		// 1. request
		// 2. 파일을 저장할 경로(상대경로)
		String path = request.getServletContext().getRealPath("./file");
		System.out.println(path);
		
		// 3. 파일 허용 용량
		int maxSize = 10*1024*1024; // 10MB
		
		// 4. 인코딩 방식
		String encoding = "UTF-8";
		
		// 5. 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			
			String title = multi.getParameter("title");
			String writer = multi.getParameter("writer");
			String filename = multi.getFilesystemName("filename");
			String content = multi.getParameter("content");
			
			Board board = new Board(title, writer, filename, content);
			
			System.out.println(board.toString());
			
			int cnt = new BoardDAO().insertBoard(board);
			
			if(cnt == 1) {
				System.out.println("파일 업로드 성공");
			}
			else {
				System.out.println("파일 업로드 실패");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		return "BoardMain.jsp";
	}

}
