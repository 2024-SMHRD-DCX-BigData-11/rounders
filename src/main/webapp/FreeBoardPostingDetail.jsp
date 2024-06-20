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
<%@ include file = "header.jsp" %>
	<div id = "board">
				<form action="#" method="post" enctype="multipart/form-data">
				<table id="list">
					<tr><td class="td">카테고리</td>
						
						<td></td>
					</tr>
					<tr><td class="td">제목</td>
						
						<td><!-- 제목 불러오기 --></td>
					</tr>
					<tr>
						<td class="td">작성자</td>
						<td><!-- 작성자 불러오기 --></td>
					</tr>
					<tr>
						<td class="td">등록일</td>
						<td><!-- 등록일 불러오기 --></td>
					</tr>
					<tr>
						<td class="td">첨부파일</td>
						<td><!-- 첨부파일 불러오기 --></td>
					</tr>
					<tr>
						<td class="td">좋아요</td>
						<td><button id = "btn_like" onclick="">좋아요</button></td>
					</tr>
					
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><h4><!-- 내용 불러오기 --></h4></td>
					</tr>
					<tr>
						<td colspan="2" id="rs">
							<a href="#"><input type="button" value="뒤로가기" id = "backButton"></a>
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
		
		document.getElementById('btn_like').addEventListener('click',
				function() {
					
				});
		
	</script>
</body>
</html>