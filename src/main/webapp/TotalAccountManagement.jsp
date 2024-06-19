<%@page import="com.baseballtalk.model.ManagerDAO"%>
<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 계정관리</title>
	<link href="./css/Total.css" rel="stylesheet" type="text/css">
</head>
<body>
<% List<MemberDTO> AllMember = new ManagerDAO().showAllMember(); %>
	<%@ include file = "header.jsp" %>
	<div id="total">
		<h4>회원 관리</h4>
			<table>
				<tr>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>닉네임</td>
					<td>전화번호</td>
					<td>가입일</td>
					<td>회원등급</td>
					<td>보유 포인트</td>
					<td>응원팀</td>
				</tr>
				
				<%for(MemberDTO mb : AllMember){%>
				<tr>
					<td><%=mb.getMem_id()%></td>
					<td><%=mb.getMem_pw()%></td>
					<td><%=mb.getMem_name()%></td>
					<td><%=mb.getMem_nick()%></td>
					<td><%=mb.getMem_tel()%></td>
					<td><%=mb.getJoined_at()%></td>
					<td><%=mb.getMem_grade()%></td>
					<td><%=mb.getMem_point()%></td>
					<td><%=mb.getTeam_idx()%></td>
				</tr>
				<%} %>
			</table>
	</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
</body>
</html>