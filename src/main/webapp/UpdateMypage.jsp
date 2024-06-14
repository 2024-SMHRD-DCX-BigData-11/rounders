<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My-page</title>
	<link href="./css/UpdateMypage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file = "header.jsp" %>
<!-- 	<div class="wrap"> -->
        <div class="update">
            <h2>회원정보 수정</h2>
            <form action="JoinCon" method="post">
            	<fieldset>
			            <div class="update_id">
			                <input type="email"  placeholder="이메일 변경 불가능" name = "update_email" readonly>
			            </div>
			            <div class="update_pw">
							<input type="password"  placeholder="변경할 비밀번호를 입력해주세요" name = "update_pw" autofocus>
			            </div>
			            <div class="update_pw">
							<input type="password"  placeholder="비밀번호를 다시 입력해주세요" name = "pwcheck">
			            </div>
			            <div class="join_pw_check">
							<a href="#"><input type="button" id="input_pw" value="비밀번호 확인" onclick="check_pw()"></a>
			            </div>
			            <div class="update_nick">
			                <input type="text"  placeholder="변경할 닉네임을 입력해주세요" name = "update_nick">
			            </div>
			            <div class="join_check">
							<a href="#"><input type="button" id="input_nick" value="닉네임 중복체크" onclick="check_nick()"></a>
			            </div>
			            <div class="update_tel">
			                <input type="tel"  placeholder="변경할 전화번호를 입력해주세요" name = "update_tel">
			            </div>
			            <div>
			            	<select>
			            		<option value="baseballteam">응원 팀 선택</option>
			            		<option value="baseballteam">기아</option>
			            		<option value="baseballteam">삼성</option>
			            		<option value="baseballteam">롯데</option>
			            		<option value="baseballteam">NC</option>
			            		<option value="baseballteam">KT</option>
			            		<option value="baseballteam">한화</option>
			            		<option value="baseballteam">키움(넥센)</option>
			            		<option value="baseballteam">두산</option>
			            		<option value="baseballteam">LG</option>
			            		<option value="baseballteam">SSG</option>
			            	</select>
			            </div>
			            <div class="submit">
			                <input type="submit" value="수정">
			            </div>
            	</fieldset>
            </form>
		  </div>
<!-- 	    </div> -->
</body>
</html>