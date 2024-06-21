<%@page import="com.baseballtalk.model.FreeBoardDTO"%>
<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.baseballtalk.model.TeamBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 게시물</title>
<link href="./css/Total.css" rel="stylesheet" type="text/css">
<style>
#wrap {
	display: flex;
	flex-direction: column;
}

.page_title {
	color: black;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="wrap">
		<div id="total">
			<h4>내가 작성한 게시물</h4>
			<%
			MemberDTO member = (MemberDTO) session.getAttribute("login_member");
			String mem_id = "";
			if (member != null) {
				mem_id = member.getMem_id();
			}
			List<TeamBoardDTO> myteamboard = new BoardDAO().myteamBoard(mem_id);
			List<FreeBoardDTO> myfreeboard = new BoardDAO().myfreeBoard(mem_id);
			String[] team = { "KIA", "LG", "삼성", "두산", "SSG", "NC", "한화", "롯데", "KT", "키움" };
			%>
			<table>
				<tr>
					<td>게시판</td>
					<td>카테고리</td>
					<td>글 제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
					<td>좋아요</td>
				</tr>
				<%
				for (TeamBoardDTO mtb : myteamboard) {
				%>
				<tr>
					<td><%=team[mtb.getTeam_idx() - 1]%></td>
					<td><%=mtb.getBoard_category()%></td>
					<td><a class="page_title"
						href="TeamBoardPostingDetail.jsp?board_idx=<%=mtb.getBoard_idx()%>"><%=mtb.getBoard_title()%></a></td>
					<%
					String nick = new MemberDAO().getNick(mtb.getMem_id());
					%>
					<td><%=nick%></td>
					<td><%=mtb.getCreated_at()%></td>
					<td><%=mtb.getBoard_views()%></td>
					<td><%=mtb.getBoard_likes()%></td>
				</tr>
				<%
				}
				%>
				<%
				for (FreeBoardDTO frb : myfreeboard) {
				%>
				<tr>
					<td>자유</td>
					<td>자유</td>
					<td><a class="page_title"
						href="FreeBoardPostingDetail.jsp?board_idx=<%=frb.getBoard_idx()%>"><%=frb.getBoard_title()%></a></td>
					<%
					String nick = new MemberDAO().getNick(frb.getMem_id());
					%>
					<td><%=nick%></td>
					<td><%=frb.getCreated_at()%></td>
					<td><%=frb.getBoard_views()%></td>
					<td><%=frb.getBoard_likes()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
	</div>
</body>
</html>