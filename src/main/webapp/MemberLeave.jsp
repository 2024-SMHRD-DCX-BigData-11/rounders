<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
	<link href="./css/MemberLeave.css" rel="stylesheet" type="text/css">
	<script>
function check_pw() {
    // 비밀번호 검사 로직 추가
}

function member_leave() {
    // confirm 함수를 사용하여 확인 창을 표시
    var confirmLeave = confirm("정말 회원 탈퇴를 하겠습니까?");
    
    // 사용자가 확인 버튼을 눌렀을 때만 회원탈퇴 진행
    if (confirmLeave) {
        alert("회원 탈퇴가 완료되었습니다."); // 회원탈퇴 완료 알림
        // 회원탈퇴 로직 추가 (예: 서버에 회원탈퇴 요청 등)
    } else {
        alert("회원 탈퇴가 취소되었습니다."); // 회원탈퇴 취소 알림
    }
}
</script>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<div id=memberleave>
		<h4>회원탈퇴</h4>
			<form action="#" method="post">
				<fieldset>
					<div id="member_leave">
						<span>비밀번호 입력</span>
						<div id="input_leave_pw">
							<input type="password" name="leave_pw" placeholder="비밀번호를 입력해주세요" autofocus>
						</div>
						<div id="check_leave_pw">
							<input type="button" value="확인" onclick="check_pw()">
							
						<%
						
						MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
					
						%>
							
						
		
						</div>
						<div id="submit_pw">
							<input type="submit" value="회원탈퇴" onclick="member_leave()">
						</div>
					</div>
				</fieldset>
			</form>
	</div>
</body>
</html>