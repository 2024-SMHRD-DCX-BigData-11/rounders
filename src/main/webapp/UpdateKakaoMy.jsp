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
            <form action="UpdateKakaoCon" method="post">
            	<fieldset>
			            <div class="update_id">
			                <input type="email"  placeholder="이메일 변경 불가능" name = "update_email" readonly>
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
			                <input type="submit" value="수정">
			            </div>
            	</fieldset>
            </form>
            </div>
<!-- 	    </div> -->
		<div>
			<%@ include file="Footer.jsp"%>
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