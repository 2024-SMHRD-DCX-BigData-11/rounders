<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.NoticeBoardDTO"%>
<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시글 수정</title>
	<link href="./css/PostingWrite.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file = "header.jsp" %>
 <!-- 로그인 세션 값 가져오기 -->
 <% MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
 	int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
 	NoticeBoardDTO notice = new BoardDAO().noticeDetail(notice_idx);
 	%>
 <%
 String mem_id = "";
 String nick = "";
 if(login_member != null){
  mem_id= login_member.getMem_id();
  nick = login_member.getMem_nick();
 }%>
	<div id = "board">
				<form action="NoticeBoardUpdateCon?notice_idx=<%=notice_idx %>" method="post" enctype="multipart/form-data">
				<table id="list">
					<tr><td><select name = "notice_category">
							<option value="category">카테고리</option>
							<option value="공지">공지</option>
							
						</select>제목</td>
						
						<td><input type="text" name="notice_title"> </td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=nick%></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<input name="filename" type="file" style="float: right;">
							<textarea name="notice_content" rows="10" style="resize: none;"></textarea>			
						</td>
					</tr>
					<tr>
						<td colspan="2" id="rs">
							<input type="reset" value="초기화">
							<input type="submit" value="작성하기">
						</td>
					</tr>
				</table>
				</form>
			</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>	
</body>
</html>