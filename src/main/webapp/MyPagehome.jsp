<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="./css/Mypagehome.css" rel="stylesheet" type="text/css">
<style type="text/css">
#mygrade {
	image-rendering: auto;
	width: 100px;
	height: 100px;
}

</style>
</head>
<body>
<%@ include file="header.jsp"%>
	<div class="wrap">
		<div class="mypagehome">
			<h2>My-Page</h2>
			<fieldset>
				<div class="mypage_home">
					<table class="mypage_table">
						<%
						MemberDTO member = (MemberDTO) session.getAttribute("login_member");
						if (member == null) {
							out.println("<script>alert('로그인이 필요한 서비스입니다.');" + "location.href='Main.jsp';</script>");
						}
						%>
						<thead>
							<tr>
								<th>닉네임</th>
								<th>포인트</th>
								<th>등급</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<%if(member != null){ %>
								<td><%=member.getMem_nick()%></td>
								<td><%=member.getMem_point()%></td>
								<td>
								<img id="mygrade"
									src="./grade/<%=member.getMem_grade()%>.png"
									alt=<%=member.getMem_grade()%>></td>
							<%} %>
							</tr>
						</tbody>
					</table>
					<%if(member != null && member.getMem_pw() != null){%>
					<a href="UpdateMypage.jsp">회원정보 수정</a>
					<%}else if(member != null && member.getMem_pw() == null) {%>
					<a class = "link" href="Main.jsp">회원정보 수정</a>
					<%} %>
					<br><a class = "link" href="MyPosting.jsp">내가 작성한 게시물</a>
					<%if(member != null && member.getMem_pw() != null){%>
					<br> <a class = "link" href="MemberLeave.jsp">회원 탈퇴</a>
					<%} %>
				</div>
			</fieldset>
		</div>
	</div>
<div><%@ include file="Footer.jsp"%></div>
</body>
</html>