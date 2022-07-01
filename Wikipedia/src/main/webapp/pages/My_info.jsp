<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wikipedia 우리 모두의 백과사전</title>
    
    <link href="../css/My_info.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="../include/Header.jsp" %>
<jsp:include page="../include/Side_Login.jsp"></jsp:include>
    <div id="container">
      <img src="../img/HatchfulExport-All/MainLogoMini.png" alt="메인로고" class="main_logo">
      <div class="long_bar"></div>
      <h4 class="main_text">내 정보</h4>
      <div class="nickNameSet">
        <h4>닉네임 변경</h4>
        <label for="user_nick">닉네임</label>
        <input type="text" placeholder="닉네임을 입력" id="user_nick" class="input_css">
        <button class="my_info_button" ><p>중복 확인</p></button>
      </div>
      <div class="pwSet">
        <h4>비밀번호 변경</h4>
        <table>
          <tr>
            <td class="input_left_liter"><label for="user_pw_change">비밀번호</label></td>
            <td><input type="text" placeholder="변경할 비밀번호를 입력" id="user_pw_change" class="input_css" ></td>
          </tr>
          <tr>
            <td class="input_left_liter"> <label for="user_email_in">이메일</label></td>
            <td><input type="text" placeholder="이메일 입력" id="user_email_in" class="input_css"></td>
          </tr>
          <tr>
            <td class="input_left_liter"><label for="user_certify_email">인증번호</label></td>
            <td><input type="text" placeholder="인증번호 입력" class="input_css" id="user_certify_email"><button class="my_info_button"><p>인증번호 발송</p></button></td>
          </tr>
        </table>  
      </div>
      <div class="long_bar"></div>
      <h4 class="main_text">내가 쓴 글</h4>
      <div class="my_info_post">
          <table border="1px solid" class="my_info_post_table">
            <tr>
              <th style="width:100px">번호</th>
              <th style="width:100px">제목</th>
              <th style="width:100px">작성자</th>
              <th style="width:100px">조회수</th>
              <th style="width:100px">작성일</th>
            </tr>
            <tr>
              <td>null</td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
            </tr>
            <tr>
              <td>null</td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
            </tr><tr>
              <td>null</td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
              <td>null</td>
            </tr>
          </table>
      </div>
      <div class="long_bar"></div>
      <h4 class="main_text">내가 쓴 댓글</h4>
      <div class="my_info_comment">
        <table border="1px solid" class="my_info_comment_table">
          <tr>
            <th style="width:100px">번호</th>
            <th style="width:100px">제목</th>
            <th style="width:100px">작성자</th>
            <th style="width:100px">조회수</th>
            <th style="width:100px">작성일</th>
          </tr>
          <tr>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
          </tr>
          <tr>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
          </tr><tr>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
            <td>null</td>
          </tr>
        </table>
      </div>
      <div class="long_bar"></div>
    </div>
</body>
</html>