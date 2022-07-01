<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link href="../css/Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="container">
        <div id="mainLogo">
            <a href="index.html"><h1><img src="../img/HatchfulExport-All/MainLogoMini.png"></h1></a>
        </div>

        <div id="loginArea">
            <h2>로그인</h2>
            <form action="../process/LoginProcess.jsp" onsubmit="return loginDataCheck(this)">
                <table>
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" name="input_userId" class="input_user"></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="input_userPw" class="input_user"></td>
                    </tr>
                </table>
                <button type="submit" name="loginBtn" class="loginBtn">로그인</button>
            </form>

            <p class="loginErrMsg">${ loginErrMsg }</p>

            <ul class="loginMenu">
                <li><a href="sign_up.html">회원가입</a></li>
                <li><a href="search_info.html">아이디 / 비밀번호 찾기</a></li>
            </ul>
        </div>
    </div><!-- #container -->
    
    <script>
    	function loginDataCheck(form){
    		if(!form.input_userId.value){
    			alert("ID를 입력하세요.");
    			form.input_userId.focus();
    			return false;
    		}
    		if(!form.input_userPw.value){
    			alert("PW를 입력하세요.");
    			form.input_userPw.focus();
    			return false;
    		}
    	}
    </script>
</body>
</html>