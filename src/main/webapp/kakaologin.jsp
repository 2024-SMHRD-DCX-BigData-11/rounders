<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<form id="form-kakao-login" method="post" action="kakaologin">
		    			<input type="hidden" name="email"/>
		    			<input type="hidden" name="name"/>
		    			<input type="hidden" name="img"/>
		    		</form>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
    $(document).ready(function(){
    	Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
            console.log(res);
            // 이메일, 성별, 닉네임, 프로필이미지
            var email = res.kakao_account.email;
            var profile_nickname = res.kakao_account.profile.nickname;
            $('#form-kakao-login input[name=email]').val(email);
			$('#form-kakao-login input[name=name]').val(profile_nickname);
			// 사용자 정보가 포함된 폼을 서버로 제출한다.
			document.querySelector('#form-kakao-login').submit();
        },
        fail: function (error) {
            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
        }
    });
    });
</script>
</body>
</html>