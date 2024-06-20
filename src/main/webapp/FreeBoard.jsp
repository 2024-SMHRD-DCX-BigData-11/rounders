<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.FreeBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
	<link href="./css/Total.css" rel="stylesheet" type="text/css">
</head>
<body>
<% List<FreeBoardDTO> showFreeBoard = new BoardDAO().showFreeBoard();%>
	<%@ include file = "header.jsp" %>
	<div id="total">
		<h1>자유게시판</h1>
			<table style="border: 1px solid #111111;">
			<thead>
				<tr>
					<th>글 제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>좋아요</th>
					<th>조회수</th>
				</tr>
				<thead>
				<%for(FreeBoardDTO fb : showFreeBoard){%>
				<%String mem_nick = new MemberDAO().getNick(fb.getMem_id()); %>
				<tbody>
				<tr>
					<td onclick="location.href='FreeBoardPostingDetail.jsp?board_idx=<%=fb.getBoard_idx()%>'"><%= fb.getBoard_title()%></td>
					<td><%= mem_nick%></td>
					<td><%= fb.getCreated_at()%></td>
					<td><%= fb.getBoard_likes()%></td>
					<td><%= fb.getBoard_likes()%></td>
				</tr>
				</tbody>
				<%}%>
			</table>
		</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
</body>
</html>