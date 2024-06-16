<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Kakao JavaScript SDK</title>
</head>
<body>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<div class="button-login" align ="center" >
	                <a id="kakao-login-btn" >
	    <img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="83%" height ="50px" />
	    </a>
	</div>
	
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script type='text/javascript'>
	Kakao.init('e06f627b378adfe075213d119135e14e');
	
	
	$("#kakao-login-btn").on("click", function(){
	    //1. 로그인 시도
	    Kakao.Auth.login({
	        success: function(authObj) {
	         
	          //2. 로그인 성공시, API 호출
	          Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(res) {
	            	var email = res.kakao_account.email;
	            	var nick = res.kakao_account.profile.nickname;
	            	$.ajax({ // {key1 : value1, key2 : value2 key3 : value3}
						// 어디로 요청할건지
						url : 'kakaologinCon',
						// 요청데이터 타입(json)
						data : {'email' : email, 'nick' : nick},
						// 요청방식
						type : 'post',
						// 요청~응답~성공
						success : function(data){
							/* alert(data); */
							console.log("데이터 전송 성공!")
							location.href="test.jsp";
						},
						
						error : function(){
							alert('error');
						}
						
					});
	        }
	          })
	          console.log(authObj);
	          var token = authObj.access_token;
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	        
	})
	


</script>

	<!-- 로그아웃 -->
	<a href="kakao_logout.jsp">카카오 로그아웃</a>


</body>
</html>