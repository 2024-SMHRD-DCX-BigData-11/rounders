<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 완료</title>
	<link href="./css/SearchPwSuccess.css" rel="stylesheet" type="text/css">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<% MemberDTO SearchPw = (MemberDTO)request.getAttribute("SearchPw");%>
	<div id = "SuccessSearchPw">
		<h1>비밀번호 찾기 완료</h1>
				<fieldset>
				
						<h4>회원님의 비밀번호는</h4>
						<h2><span><%=SearchPw.getMem_pw()%></span></h2>
						<h4>입니다.</h4>

				</fieldset>
	</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
</body>
</html>