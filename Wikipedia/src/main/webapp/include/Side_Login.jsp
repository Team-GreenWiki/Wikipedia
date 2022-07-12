<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <link href="../css/Side_Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
        <!-- 로그인 한 후 사이드 메뉴 -->
<div class="side_whole">
    <div class="side_above">

      <h4>님 반갑습니다!</h4>
      <!-- h4태그 좌측에 나중에 유저 닉네임 표시되야함 -->
      <a href="./my_info">내 정보</a>
      <a href="">로그아웃</a>
      <!-- jsp로 로그아웃 시키는 기능 나중에 추가해야함 -->
    </div>

    <!-- 
      추후에 나머지 페이지 완성시 href에 경로 기입할 것.
     -->
    <div class="side_middle">
      <a href="">정보 문서</a>
      <a href="">도움말</a>
      <a href="">임의의 문서로</a>
      <a href="">내가 쓴 글</a>
      <a href="">내가 쓴 댓글</a>
    </div>
  </div>
</body>
</html>