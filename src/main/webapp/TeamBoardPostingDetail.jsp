<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.TeamBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
	<link href="./css/PostingDetail.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	int board_idx = Integer.parseInt(request.getParameter("board_idx"));
	TeamBoardDTO teamBoard = new BoardDAO().TeamDetail(board_idx) ;
	String mem_nick = new MemberDAO().getNick(teamBoard.getMem_id());
%>
<%@ include file = "header.jsp" %>
	<div id = "board">
				<form action="#" method="post" enctype="multipart/form-data">
				<table id="list">
					<tr><td class="td">카테고리</td>
						
						<td><%=teamBoard.getBoard_category()%></td>
					</tr>
					<tr><td class="td">제목</td>
						
						<td><%=teamBoard.getBoard_title()%></td>
					</tr>
					<tr>
						<td class="td">작성자</td>
						<td><%=mem_nick%></td>
					</tr>
					<tr>
						<td class="td">등록일</td>
						<td><%=teamBoard.getCreated_at()%></td>
					</tr>
					<tr>
						<td class="td">조회수</td>
						<td><%=teamBoard.getBoard_views()%></td>
					</tr>
					<tr>
						<td class="td">좋아요</td>
						<td><%=teamBoard.getBoard_likes()%></td>
					</tr>
					<tr>
						<td class="td">첨부파일</td>
						<td><%=teamBoard.getBoard_file()%></td>
					</tr>
					
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><h4><%=teamBoard.getBoard_content()%></h4></td>
					</tr>
					<tr>
						<td colspan="2" id="rs">
							<a href="#"><input type="button" value="뒤로가기"></a>
						</td>
					</tr>
				</table>
				</form>
			</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
	<script>
		document.getElementById('backButton').addEventListener('click',
				function() {
					window.history.back(); // 브라우저의 뒤로 가기 기능을 실행합니다.
				});
	</script>
</body>
</html>