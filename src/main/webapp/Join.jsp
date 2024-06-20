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
            <img alt="logo" src="./image/btlogo.png">
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
	    
	    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script type="text/javascript">
		    
				function pw_check() {
					document.getElementById('result_pw_check').style.display = 'block'
					
					var pw = $('#password').val();
					console.log(pw);
					
					var pwcheck = $('#pwcheck').val();
					console.log(pwcheck);
					
					if(pw === pwcheck & pw != null & pwcheck != null){
						
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
					
					const nick = $('#nickname').val().trim(); // nick의 값에서 공백을 제거한 후 저장
				    console.log(nick);

				    if (nick !== null && nick !== '') { // nick이 null이 아니고, 공백이 아닌 경우
				        console.log("닉네임 확인 - 입력됨");
				        $.ajax({
				        	url: 'NickCheckCon', // 서블릿 매핑된 경로
				            data: {'nick': nick},
				            type: 'post',
				            success: function(data) {
				                if (data === 'true') {
				                    console.log("닉네임 확인 - 중복");
				                    $('#result_nick_check').text('중복된 닉네임 입니다.');
				                    $('#result_nick_check').css('color', 'red');
				                } else if (data === 'false') {
				                    console.log("닉네임 확인 - 사용 가능");
				                    $('#result_nick_check').text('사용할 수 있는 닉네임입니다.');
				                    $('#result_nick_check').css('color', 'blue');
				                }
				            },
				            error: function() {
				            	console.log("에러")
				                alert('error');
				            }
				        });
				    } else {
				        console.log("닉네임 확인 - 입력 요청");
				        $('#result_nick_check').text('닉네임을 입력해주세요');
				        $('#result_nick_check').css('color', 'red');
				    }
					
				}
			
			</script>
	    
		   
	    
</body>
</html>