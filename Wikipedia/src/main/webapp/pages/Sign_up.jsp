<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="./css/Sign_up.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <wrap>
    <form action="#" method="post">
      <!-- 로고 -->
      <div class="mainLogo">
        <a href="./Index.html"><img src="../img/HatchfulExport-All/MainLogoMini.png" alt="#"></a>
        <h2>위키피디아는 당신의 것입니다!</h2>
      </div>
      
    <div class="table_div"> <!-- 가입 테이블 감싼것  -->
      
      <table>
        <tr>
          <td><p>아이디</p></td>
          <td><input type="text" placeholder="8자 이상" class="id_in" ></td>
        </tr>
        <tr>
          <td><p>비밀번호</p></td>
          <td><input type="text" placeholder="특수문자,영/대문자 포함 10자 이상" class="pw_in"></td>
        </tr>
        <tr>
          <td><p>비밀번호 확인</p></td>
          <td><input type="text" placeholder="비밀번호를 다시 입력해주세요" class="pw_reIn"></td>
        </tr>
        <tr>
          <td><p>E-mail</p></td>
          <td class="place_user_writing_Email">
            <input type="text" placeholder="이메일을 입력하세요">
            <select name="user_email_sel" id="userEmail">
              
              <option value="emailetc1">@naver.com</option>
              <option value="emailetc2">@daum.net</option>
              <option value="emailetc3">@gmail.com</option>
              <option value="emailetc4">@hanmail.net</option>
              <option value="emailetc5">@nate.com</option>
              <option value="emailDefault" onclick="user_write_Email()">직접 입력</option>
              <!--  직접 입력시 인풋창 따로 생성되도록 만드려고 함 -->
            </select>
          </td>
        </tr>
        <tr>
          <td><p>닉네임</p></td>
          <td><input type="text" placeholder="닉네임을 입력해주세요"></td>
        </tr>
        <tr>
          <td rowspan="2"><p>본인확인 질문</p></td>
          <td>
            <select name="user_idenfity_question" id="userQuest" >
              <option value="questionDefault">질문을 선택하세요</option>
              <option value="question1">당신의 고향은?</option>
              <option value="question2">초등학생 시절 별명은?</option>
              <option value="question3">가장 좋아하는 음식은?</option>
              <option value="question4">자신의 좌우명</option>
            </select>
          </td>
        </tr>
        <tr>
          <td><input type="text" placeholder="정답을 입력하세요" id="userAnswer"></td>
        </tr>
      </table>
      
    </div>
    <input type="button" value="SIGN UP" class="sign_up_btn">

    </form>
  </wrap>
    <script>
      // 이메일 도메인 직접 입력시 인풋창 생성하는 함수 만드는중
      function user_write_Email(){
        let directWriteEmail = document.querySelector("#userQuest").getAttribute
          let input =  document.createElement("input");
          intput.setAttribute('type','text');
          intput.setAttribute('placeholder','도메인을 입력하세요');
          let thePlace = document.querySelector("place_user_write_Email");
          thePlace.appendChild(input);
          
      }
    </script>
</body>
</html>