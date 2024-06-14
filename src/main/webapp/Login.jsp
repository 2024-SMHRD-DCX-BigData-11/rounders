<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link href="./css/Login.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="wrap">
        <div class="login">
            <img alt="logo" src="./image/logo.jpg">
            <form action="LoginCon" method="post">
            	<fieldset>
		            <div class="login_id">
		                <h4>E-mail</h4>
		                <input type="email" name="email" placeholder="이메일" autofocus required>
		            </div>
		            <div class="login_pw">
		                <h4>Password</h4>
		                <input type="password" name="pw" placeholder="비밀번호" required>
		            </div>
		            <div class="submit">
		                <input type="submit" value="로그인">
		            </div>
            	</fieldset>
            </form>
		  </div>
	    </div>
		<ul>
			<li><a target="_blank" href="SerchPassword.jsp" class="find_text">비밀번호 찾기</a></li>
			<li><a target="_blank" href="Join.jsp" class="find_text">회원가입</a></li>
		</ul>
</body>
</html>