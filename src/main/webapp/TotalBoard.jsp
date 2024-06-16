<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="./css/TotalBoard.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file = "header.jsp" %>
	<div id="totalboard">
		<h4>전체 게시글</h4>
			<table>
				<tr>
					<td>카테고리</td>
					<td>제목</td>
					<td>좋아요</td>
					<td>작성자</td>
					<td>작성일시</td>
					<td>조회수</td>
				</tr>
			</table>
	</div>
</body>
</html>