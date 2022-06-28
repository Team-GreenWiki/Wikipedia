<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
    /* 헤더를 감싸는 div  */
    .header_wrap{
      display: flex;
      width: 900px;
      height: 40px;
      margin: 0 auto;
    }
    /* 헤더의 메인 로고 */
    .header_main_logo{
      width: 90px;
      height: 22px;
      margin-top: 8px;
    }

    /* 헤더의 검색창 */
    .head_search_input{
      width: 450px;
      height: 30px;
      margin-left: 10px;
      border-radius: 15px;
      border: 2px solid #4b2b30;
    }

    /* 헤더의 계정만들기 버튼(span) */
    .header_signup{
      margin-left: 10px;
      line-height: 30px;
    }
    /* 더보기 버튼 (p태그) */
    .header_addition_btn{
      width: 50px;
      display: inline-block;
      transform: rotate(90deg);
      font-size: 20px;
    }
  </style>
</head>
<body>
  <div class="header_wrap">
  <img src="../img/HatchfulExport-All/MainLogoMini.png" alt="" class="header_main_logo">
  <input type="text" class="head_search_input">
  <span class="header_signup">계정 만들기</span>
  <p class="header_addition_btn">...</p>
  </div>
</body>
</html>