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
	<%@ include file = "header.jsp" %>
	<div id="total">
		<h4>공지사항</h4>
			<table>
				<tr>
					<td>글 제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
					<td>좋아요</td>
				</tr>
			</table>
		</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
</body>
</html>