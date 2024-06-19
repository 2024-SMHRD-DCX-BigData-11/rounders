<%@page import="com.baseballtalk.model.TeamBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.baseballtalk.model.ManagerDAO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시글</title>
	<link href="./css/Total.css" rel="stylesheet" type="text/css">
</head>
<body>
	<% List<FreeBoardDTO> FreeBoard = new ManagerDAO().showFreeBoard(); %>
	<% List<TeamBoardDTO> TeamBoard = new ManagerDAO().showTeamBoard(); %>
	<%@ include file = "header.jsp" %>
	<div id="total">
		<h4>자유 게시판 게시글</h4>
			<table>
				<tr>
					<td>게시판 번호</td>
					<td>글 번호</td>
					<td>카테고리</td>
					<td>글 제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
					<td>좋아요</td>
				</tr>
				<%for(FreeBoardDTO fb : FreeBoard){%>
				<tr>
					<td>0</td>
					<td><%=fb.getBoard_idx() %></td>
					<td>0</td>
					<td><%=fb.getBoard_title() %></td>
					<td><%=fb.getMem_id() %></td>
					<td><%=fb.getCreated_at() %></td>
					<td><%=fb.getBoard_views() %></td>
					<td><%=fb.getBoard_likes() %></td>
				</tr>
				<%} %>
			</table><br><br>
			<h4>팀 게시판 게시글</h4>
			<table>
				<tr>
					<td>게시판 번호</td>
					<td>글 번호</td>
					<td>카테고리</td>
					<td>글 제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
					<td>좋아요</td>
				</tr>
			<%for(TeamBoardDTO tb : TeamBoard){%>
				<tr>
					<td><%=tb.getTeam_idx()%></td>
					<td><%=tb.getBoard_idx()%></td>
					<td><%=tb.getBoard_category()%></td>
					<td><%=tb.getBoard_title()%></td>
					<td><%=tb.getMem_id()%></td>
					<td><%=tb.getCreated_at()%></td>
					<td><%=tb.getBoard_views()%></td>
					<td><%=tb.getBoard_likes()%></td>
				</tr>
				<%} %>
			</table>
	</div>
	<div>
			<%@ include file="Footer.jsp"%>
			</div>
		
</body>
</html>