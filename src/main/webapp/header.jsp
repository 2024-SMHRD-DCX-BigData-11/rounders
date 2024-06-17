<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/1b2fc50a32.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<title>Nav bar</title>
<style type="text/css">


    
body {
	margin:0;
    font-family: 'Jua';
}

.navbar__menu {
  margin-right: 150px;
}

img {
	width: 80%;
	height: 80px;
}

a {
    text-decoration: none;
    padding : 10px;
    color: white;
    text-align: center;
}


.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #00421f;

}

.navbar__logo {

    color: white;
}

.navbar__menu {
  display: flex; /* 내부 요소들을 Flexbox로 배치 */
  list-style-type: none; /* 리스트의 기본 마커를 제거 */
  padding: 0; /* 내부 패딩 초기화 */
}

.navbar__menu li:hover {
    background-color: grey;
    border-radius: 4px;
}

.navbar__links {
    list-style: none;
    padding-left: 0;
    color: teal;
    display: flex;
}

.navbar__links li {
    padding: 8px 12px;
}

.navbar__toggleBtn {
    display: none;
    position: absolute;
    right: 32px;
    font-size: 24px;
}

@media screen and (width<=768px) {
    .navbar {
        flex-direction: column;
        align-items: flex-start;
        padding: 8px 24px;
    }
    img {
	width: 80%;
	height: 50px;
	}
    
    .navbar__menu {
        display: none;
        flex-direction: column;
        align-items: center;
        width: 100%;
        margin : 10px;
    }
    .navbar__menu li {
        width: 100%;
        text-align: center;
    }
    .navbar__links {
        display: none;
        justify-content: center;
        width: 100%;
    }
    .navbar__toggleBtn {
        display: block;
    }

    .navbar__menu.active,
    .navbar__links.active {
        display: flex;
    }
}
</style>
</head>
<body>
 <nav class="navbar">
        <div class="navbar__logo">
            <a href=""><img alt="logo" src="./image/logo.jpg"></a>
        </div>
        <ul class="navbar__menu">
            <li><a href="">기록실</a></li>
            <li><a href="">핫플레이어</a></li>
            <li><a href="">게시판</a></li>
        </ul>
        <ul class="navbar__links">
            <li> <a href="">회원가입</a></li>
            <li><a href="">로그인</a></li>
        </ul>

        <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
    </nav>
    

</body>
</html>