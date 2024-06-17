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
		             <div class="join_name">
		                <input type="text"  placeholder="이름" name = "name" required>
		            </div>
		            <div class="join_pw">
						<input type="password"  placeholder="비밀번호" name = "pw" id = "password" required>
		            </div>
		            <div class="join_pw">
						<input type="password"  placeholder="비밀번호를 다시 입력해주세요" id = "pwcheck" required>
		            </div>
		            <div class="join_pw_check">
						<input type="button" id="pw_c" value="비밀번호 확인" onclick="pw_check()" required>
		            </div>
		            <div id="result_pw_check" style = "display:none" align="center">
						<span id="result_pw_check"></span>
		            </div>
		            <div class="join_nick">
		                <input type="text"  placeholder="닉네임" name = "nick" id="nickname" required>
		            </div>
		            <div class="join_nick_check">
						<input type="button" id="nick_c" value="닉네임 중복체크" onclick="nick_check()" required>
		            </div>
		             <div id="result_nick_check" style = "display:none" align="center">
						<span id="result_nick_check"></span>
		            </div>
		            <div class="join_tel">
		                <input type="tel"  placeholder="전화번호" name = "tel" required>
		            </div>
		            <div>
		            	<select name = "team_Num">
		            		<option value="baseballteam">응원 팀 선택</option>
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
	    
	    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script type="text/javascript">
		    
				function pw_check() {
					document.getElementById('result_pw_check').style.display = 'block'
					
					var pw = $('#password').val();
					console.log(pw);
					
					var pwcheck = $('#pwcheck').val();
					console.log(pwcheck);
					
					if(pw == pwcheck){
						
						$('#result_pw_check').text('비밀번호가 일치합니다.');
						$('#result_pw_check').css('color', 'blue');
						
					}
					else{
						
						$('#result_pw_check').text('비밀번호가 일치하지 않습니다.');
						$('#result_pw_check').css('color', 'red');
						
					}
					
				}
				
				
				function nick_check(){
					
					document.getElementById('result_nick_check').style.display = 'block'
					
					const nick = $('#nickname').val();
					console.log(nick);
					
					$.ajax({ // { key1 : value1, key2 : value2, key3 : {}}
						// 어디로 요청할건지
						url : 'NickCheckCon',
						// 요청데이터 타입(json)
						data : {'nick' : nick},
						// 요청방식
						type : 'get',
						// 요청-응답-성공
						success : function(data){
							/* alert(data); */
							if(data=='true'){
								$('#result_nick_check').text('중복된 닉네임 입니다.');
								$('#result_nick_check').css('color', 'red');
							}else if(data=='false'){
								$('#result_nick_check').text('사용할 수 있는 닉네임입니다.');
								$('#result_nick_check').css('color', 'blue');
							}
						},
						error : function(){
							alert('error');
						}
					})
					
				}
			
			</script>
	    
		   
	    
</body>
</html>