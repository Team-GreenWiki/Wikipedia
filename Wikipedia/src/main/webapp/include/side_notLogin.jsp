<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
     *{
      margin: 0;
      padding: 0;
      position:relative;
    }
    .side_whole{
      position:absolute;
      top:30%;
      left:5%;
      width: 300px;
      height: 700px;
      border: 2px solid #4b2b30;
      border-radius: 15px;
      background-color: #884e56;
    }
    .side_above{
      margin-top: 50px;
      font-size: larger;
      margin-bottom: 80px;
    }
    .side_above>h4{
      font-size: larger;
      text-align: center;
      color: #fff;
    }
    .side_above>a{
      display: block;
      font-size: small;
      text-align: center;
      text-decoration: none;
      color: #fff;
    }
    .side_middle{
      display: block;
    }
    .side_middle>a{
      font-size: larger;
      display: block;
      text-align: center;
      margin-bottom: 50px;
      text-decoration: none;
      color: #fff;
    }
  </style>
</head>
<body>

   <!-- 로그인 하기 전 사이드 메뉴 -->
  <div> 
    <div class="side_whole">
    <div class="side_above">

      <h4>로그인 하세요</h4>
    </div>

    <!-- 
      추후에 나머지 페이지 완성시 href에 경로 기입할 것.
    -->
	    <div class="side_middle">
	      <a href="">정보 문서</a>
	      <a href="">도움말</a>
	      <a href="">임의의 문서로</a>
	      <a href="./login.html">내가 쓴 글</a>
	      <a href="./login.html">내가 쓴 댓글</a>
	    </div>
	  </div>
 </div>
    
</body>
</html>