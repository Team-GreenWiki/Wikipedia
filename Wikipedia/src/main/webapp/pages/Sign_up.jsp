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
    <form action="../process/SignupProcess.jsp" method="post" onsubmit="return dataCheck(this);"> 
      <!-- 로고 -->
      <div class="mainLogo">
        <a href="./Index.html"><img src="../img/HatchfulExport-All/MainLogoMini.png" alt="#"></a>
        <h2>위키피디아는 당신의 것입니다!</h2>
      </div>
    
    <div class="table_div"> <!-- 가입 테이블 감싼것  -->
      
      <table>
        <tr>
          <td><p>아이디</p></td>
          <td>
          	<input type="text" placeholder="8자 이상" class="input_userId" name="input_userId">
          	<button type="button" onclick="">중복확인</button>
          </td>
        </tr>
        <tr>
          <td><p>비밀번호</p></td>
          <td><input type="text" placeholder="특수문자,영/대문자 포함 10자 이상" class="input_userPw" name="input_userPw"></td>
        </tr>
        <tr>
          <td><p>비밀번호 확인</p></td>
          <td><input type="text" placeholder="비밀번호를 다시 입력해주세요" class="input_userPw2" name="input_userPw2"></td>
        </tr>
        <tr>
          <td><p>E-mail</p></td>
          <td class="place_user_writing_Email">
            <input type="text" placeholder="이메일을 입력하세요" name="input_userEmail">
          </td>
        </tr>
        <tr>
          <td><p>닉네임</p></td>
          <td><input type="text" placeholder="닉네임을 입력해주세요" name="input_userName"></td>
        </tr>
      </table>
      
    </div>
    
    <input type="submit" value="SIGN UP" class="sign_up_btn">

    </form>
  </wrap>
  
    <script>
    	function dataCheck(form){
    		// 데이터 공백 검사
    		if(form.input_userId.value == ""){
    			alert("아이디를 입력하세요");
    			form.input_userId.focus();
    			return false;
    		}
    		if(form.input_userPw.value == ""){
    			alert("비밀번호를 입력하세요");
    			form.input_userPw.focus();
    			return false;
    		}
    		if(form.input_userPw2.value == ""){
    			alert("비밀번호를 한 번 더 입력하세요");
    			form.input_userPw2.focus();
    			return false;
    		}
    		if(form.input_userEmail.value == ""){
    			alert("이메일을 입력하세요");
    			form.input_userEmail.focus();
    			return false;
    		}
    		if(form.input_userName.value == ""){
    			alert("닉네임을 입력하세요");
    			form.input_userName.focus();
    			return false;
    		}
    		
    		// 비밀번호 일치 확인
    		if(form.input_userPw.value != form.input_userPw2){
    			alert("비밀번호가 일치하지 않습니다");
    			form.input_userPw.focus();
    			return false;
    		}
    		
    		// 이메일 형식 확인
    		let check1 = form.input_userEmail.value.indexOf("@"); // @ 포함여부
    		let check2 = form.input_userEmail.value.indexOf("."); // . 포함여부
    		if(check1 == -1 || check2 == -1 || check1 > check2){
    			alert("이메일 형식이 잘못되었습니다");
    			form.input_userEmail.focus();
    			return false;
    		}
    	}
    </script>
</body>
</html>