<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wikipedia 우리 모두의 백과사전</title>
    <link rel="stylesheet" href="../search_Info.css" type="text/css">
    
</head>
<body>
    <div id="container">
        <div id="mainLogo">
            <a href="#"><h1><img src="../img/HatchfulExport-All/MainLogoMini.png"></h1></a>
        </div> <!-- #mainLogo -->

        <div id="text">
            <h1>아이디 / 비밀번호 찾기</h1>
        </div> <!-- #text -->

        

        <form action="" name="search_Id" method="post" class="search_Id">

            <div id="search_yourId">
                <p>아이디 찾기</p>
            </div>
            
            <table>
                <div class="user_Id">
                    <tr>
                        <td class="Nick">닉네임</td>
                        <td><label for="nickName">
                                <input type="text" name="nickName" class="input_nickName" placeholder="8자리 이내로 입력하세요.">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td class="Email">이메일</td>
                        <td><label for="user_Email">
                                <input type="email" name="user_Email" class="input_Email" placeholder="이메일 형식에 맞춰주세요.">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="value">
                            <input type="submit" value="저장" class="commit">
                            <input type="reset" value="취소" class="cancel">
                        </td>
                    </tr>
                </div> <!-- #user_Id -->
            </table>
        </form> <!-- .search_Id-->

        

        <form action="" name="search_Pw" method="post" class="search_Pw">
            
            <div id="search_yourPw">
                <p>비밀번호 찾기</p>
            </div>

            <table>
                <div class="user_Pw">
                    <tr>
                        <td>아이디</td>
                        <td><label for="">
                                <input type="text" name="nickName" class="user_id" placeholder="8자리 이내로 입력하세요.">
                            </label>
                        </td>
                    </tr>
                </div>
                
                <div>
                    <tr>
                        <td>이메일</td>
                        <td><label for="user_Email">
                                <input type="email" name="user_Email" class="user_email" placeholder="이메일 형식에 맞춰주세요.">
                            </label>
                        </td>
                    </tr>
                </div>

                <div>
                    <tr>
                        <td>인증번호</td>
                        <td><label for="call_Num">
                                <input type="text" name="call_Num" class="user_num" placeholder="인증번호를 입력하세요.">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="value_2">
                            <input type="submit" value="저장" class="comm">
                            <input type="reset" value="취소" class="can">
                        </td>
                    </tr>
                </div>
            </table>
        </form> <!-- .search_Id-->
    </div> <!-- #container -->
</body>
</html>