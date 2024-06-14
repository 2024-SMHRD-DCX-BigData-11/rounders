<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link href="./css/Join.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="wrap">
        <div class="join">
            <img alt="logo" src="./image/logo.jpg">
            <form action="JoinCon" method="post">
            	<fieldset>
		            <div class="join_id">
		                <input type="email"  placeholder="이메일" name = "email" autofocus required>
		            </div>
		            <div class="join_pw">
						<input type="password"  placeholder="비밀번호" name = "pw" required>
		            </div>
		            <div class="join_pw">
						<input type="password"  placeholder="비밀번호를 다시 입력해주세요" name = "pwcheck" required>
		            </div>
		            <div class="join_pw_check">
						<a href="#"><input type="button" id="input_pw" value="비밀번호 확인" onclick="check_pw()" required></a>
		            </div>
		            <div class="join_nick">
		                <input type="text"  placeholder="이름" name = "name" required>
		            </div>
		            <div class="join_nick">
		                <input type="text"  placeholder="닉네임" name="nick" required>
		            </div>
		            <div class="join_nick_check">
						<a href="#"><input type="button" id="input_nick" value="닉네임 중복체크" onclick="check_nick()" required></a>
		            </div>
		            <div class="join_tel">
		                <input type="tel"  placeholder="전화번호" name = "tel" required>
		            </div>
		            <div>
		            	<select name = "team_Num">
		            		<option>응원 팀 선택</option>
		            		<option value="1">기아</option>
		            		<option value="3">삼성</option>
		            		<option value="8">롯데</option>
		            		<option value="6">NC</option>
		            		<option value="9">KT</option>
		            		<option value="7">한화</option>
		            		<option value="10">키움(넥센)</option>
		            		<option value="4">두산</option>
		            		<option value="2">LG</option>
		            		<option value="5">SSG</option>
		            	</select>
		            </div>
		            <div class="submit">
		                <input type="submit" value="회원가입">
		            </div>
            	</fieldset>
            </form>
		  </div>
	    </div>
</body>
</html>