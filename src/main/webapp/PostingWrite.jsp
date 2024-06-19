<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
	<link href="./css/PostingWrite.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file = "header.jsp" %>
	<div id = "board">
				<form action="BoardCon.do" method="post" enctype="multipart/form-data">
				<table id="list">
					<tr><td><select>
							<option value="category">카테고리</option>
							<option value="category">잡담</option>
							<option value="category">정보</option>
							<option value="category">직관모임</option>
						</select>제목</td>
						
						<td><input type="text" name="title"> </td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input  type="text" name="writer"> </td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<input name="filename" type="file" style="float: right;">
							<textarea name="content" rows="10" style="resize: none;"></textarea>			
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