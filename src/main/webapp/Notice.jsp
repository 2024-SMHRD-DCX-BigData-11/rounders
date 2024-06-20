<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.NoticeBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="./css/Total.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	List<NoticeBoardDTO> showNoticeBoard = new BoardDAO().showNoticeBoard();
	%>

	<%@ include file="header.jsp"%>
	<div id="total">
		<h1>공지사항</h1>
		
			<table class="table" style="border: 1px solid #111111;">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>



				<%
				for (NoticeBoardDTO nb : showNoticeBoard) {
				%>
				<%
				String mem_nick = new MemberDAO().getNick(nb.getMem_id());
				%>
				<tbody>
					<tr>
						<td><%=nb.getNotice_category()%></td>
						<td><%=nb.getNotice_title()%></td>
						<td><%=mem_nick%></td>
						<td><%=nb.getCreated_at()%></td>
						<td><%=nb.getNotice_views()%></td>
					</tr>



				</tbody>
				<%
				}
				%>
			</table>
		</div>
	
	<div>
		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>