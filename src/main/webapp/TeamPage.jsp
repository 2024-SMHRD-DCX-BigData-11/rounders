<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 게시판</title>
<link href="./css/TeamPage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="header.jsp"%>

	<img alt="logo" src="./image/kiaimg.jpg" class="kia_img">
	<div class="all">
		<div class="left">
		<div id="team">
			<h1>
				KIA게시판 <select>
					<option value="category">카테고리</option>
					<option value="category">잡담</option>
					<option value="category">정보</option>
					<option value="category">직관모임</option>
				</select>
			</h1>
			<span style="color: red">!! 지금 핫한 게시물 !! >>></span>
			<table class="table">
				<colgroup>
					<col width="60px">
					<col width>
					<col width="50px">
					<col width="110px">
					<col width="70px">
					<col width="50px">
				</colgroup>
				<thead>
					<tr>
						<td>카테고리</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일자</td>
						<td>조회수</td>
						<td>좋아요</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>vsDDDDDDDD</td>
						<td>vsdhtrsshssdddddddddddddddddddddddddgagggggggggggggggggggggggg</td>
						<td>sssssssss</td>
						<td>seeeeeeeeee</td>
						<td>eeee</td>
						<td>aaaaa</td>
					</tr>
					<tr>
						<td>vsDDDDDDDD</td>
						<td>vsdhtrsshssdddddddddddddddddddddddddgagggggggggggggggggggggggg</td>
						<td>sssssssss</td>
						<td>seeeeeeeeee</td>
						<td>eeee</td>
						<td>aaaaa</td>
					</tr>
					<tr>
						<td>vsDDDDDDDD</td>
						<td>vsdhtrsshssdddddddddddddddddddddddddgagggggggggggggggggggggggg</td>
						<td>sssssssss</td>
						<td>seeeeeeeeee</td>
						<td>eeee</td>
						<td>aaaaa</td>
					</tr>
					<tr>
						<td>vsDDDDDDDD</td>
						<td>vsdhtrsshssddddddddddggggggggggggggggggggg</td>
						<td>sssssssss</td>
						<td>seeeeeeeeee</td>
						<td>eeee</td>
						<td>aaaaa</td>
					</tr>
					<tr>
						<td>dsfassssssssssvsDDDDDDDD</td>
						<td>dddddddddddddgagggggggddddddddddddddddddddddddddddddddddddddggggggggggggggggg</td>
						<td>sssssssss</td>
						<td>seeeeeeeeee</td>
						<td>eeee</td>
						<td>aaaaa</td>
					</tr>
				</tbody>
			</table>
			<div class="write">
				<a href="PostingWrite.jsp"><input type="button" name="write" value="글 쓰기" id="write"></a>
			</div>
			<div class="page">
				<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
				<a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a>
				<a href="#">9</a> <a href="#">10</a> <a href="#" class="next"
					title="다음"><input type="button" name="next" value="다음"></a>
			</div>
		</div>
			<div class="right">
				<div class="rightone">
					<table id="schedule_wrap">
						<tr>
							<th colspan="3" id="match_date">오늘의 경기<br> <span>${match.get(0).getMatch_date()}</span></th>
						</tr>
						<c:forEach var="i" begin="0" end="4" step="1">
							<tr>
								<td><span class="team">${match.get(i).getAway_team()}</span><br>
									<span class="pitcher">${match.get(i).getAway_pitcher() }</span></td>
								<td>${match.get(i).getMatch_time() }</td>
								<td><span class="team">${match.get(i).getHome_team() }</span><br>
									<span class="pitcher">${match.get(i).getHome_pitcher() }</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 버튼 -->
				<div class="rightone">
					<input type="button" value="응원하기" onclick="openPopup()">
				</div>
			</div>
		</div>

		<!-- 팝업 창 -->
		<div class="overlay" id="overlay"></div>
		<div class="popup" id="popup">
			<h2>응원하기</h2>
			<div>팀 응원가</div>
			<div>
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/cGs5swSDvJ8?si=7xh4_WbYPHFuOThA"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			</div>
			<a target="_blank" href="https://teamstore.tigers.co.kr/"><img
				id="logo" src="./image/kia.svg"></a> <span><< 굿즈 사러가기 </span> <span
				style="color: red">CLICK!</span>
			<button onclick="closePopup()">닫기</button>
		</div>


		<script>
			function openPopup() {
				document.getElementById('overlay').style.display = 'block';
				document.getElementById('popup').style.display = 'block';
			}

			function closePopup() {
				document.getElementById('overlay').style.display = 'none';
				document.getElementById('popup').style.display = 'none';
			}
		</script>
</body>
</html>