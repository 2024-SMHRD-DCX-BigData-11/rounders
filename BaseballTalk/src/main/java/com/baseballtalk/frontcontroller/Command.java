package com.baseballtalk.frontcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	// 인터페이스 : 틀
	// ex) 이력서
	// 추상메소드 : 값은 없지만 메소드의 기본 값을 설정해주는 역할
	// ex) 이력서 안의 필수 항목 : 이름, 전화번호, 주소... -> 무조건 구현해야하는 메소드
	
	// 메소드 이름 : execute(), 매개변수 : request, response, 리턴 타입 : String
	
	public abstract String execute(HttpServletRequest request, HttpServletResponse response);
	
	
}
