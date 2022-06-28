<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }

        a{
            color: #000;
            text-decoration: none;
        }

        li{
            list-style: none;
        }

        body{
            background-color: #4b2b3010;
        }

        /* #container */
        #container{
            width: 1200px;
            margin: 0 auto;
        }

        /* #mainLogo */
        #mainLogo{
            width: 400px;
            height: 100px;
            text-align: center;
            margin: 0 auto;
            margin-top: 100px;
        }

        #mainLogo img{
            width: 100%;
            height: 100%;
        }

        /* #loginArea */
        #loginArea{
            width: 500px;
            height: auto;
            margin: 0 auto;
            margin-top: 50px;
            padding: 10px;
            box-sizing: border-box;

            border: 2px solid #4b2b30;
            border-radius: 10px;

            position: relative;
        }

        #loginArea h2{
            text-align: center;
            font-size: 25px;
            line-height: 30px;
        }

        #loginArea table th{
            width: 100px;
            height: 30px;
            padding-right: 20px;
            box-sizing: border-box;

            text-align: right;
            font-size: 15px;
            line-height: 30px;
        }

        #loginArea table .input_user{
            width: 250px;
        }

        #loginArea .loginBtn{
            width: 100px;
            height: 66px;

            position: absolute;
            top: 40px;
            right: 10px;

            font-size: 15px;
            font-weight: bold;
            border: 1px solid #4b2b30;
            border-radius: 5px;
        }

        #loginArea .loginErrMsg{
            /* display: none; */
            margin-top: 10px;

            text-align: center;
            color: red;
            font-weight: bold;
            font-size: 13px;
        }

        #loginArea ul{
            margin-top: 10px;

            display: flex;
            justify-content: space-around;
            
            font-size: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div id="container">
        <div id="mainLogo">
            <a href="index.html"><h1><img src="../img/HatchfulExport-All/MainLogoMini.png"></h1></a>
        </div>

        <div id="loginArea">
            <h2>로그인</h2>
            <form action="#">
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

            <p name="loginErrMsg" class="loginErrMsg">아이디 또는 비밀번호가 잘못되었습니다.</p>

            <ul class="loginMenu">
                <li><a href="sign_up.html">회원가입</a></li>
                <li><a href="search_info.html">아이디 / 비밀번호 찾기</a></li>
            </ul>
        </div>
    </div><!-- #container -->
</body>
</html>