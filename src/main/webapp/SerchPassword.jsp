<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
	<link href="./css/SerchPassword.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="login">
            <img alt="logo" src="./image/btlogo.png">
            <form action="LoginCon" method="post">
            	<fieldset>
		            <div class="login_id">
		                <h4>E-mail</h4>
		                <input type="email" name="email" placeholder="이메일" autofocus required>
		            </div>
		            <div class="login_name">
		                <h4>Name</h4>
		                <input type="text" name="name" placeholder="이름" required>
		            </div>
		            <div class="login_tel">
		                <h4>Tel</h4>
		                <input type="tel" name="tel" placeholder="전화번호" required>
		            </div>
		            <div class="submit">
		                <input type="submit" value="확인">
		            </div>
            	</fieldset>
            </form>
		  </div>
</body>
</html>