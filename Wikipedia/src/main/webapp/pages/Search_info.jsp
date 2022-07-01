<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link href="../css/Search_info.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    
        <a href="#"><img src="../img/HatchfulExport-All/MainLogoMini.png" class="mainLogo"></a>

    <div id="text">
        <h1>아이디 / 비밀번호 찾기</h1>
    </div>

    <form action="" name="search_info" method="post">
        <table>
            <div>
                <tr class="search_userId">
                    <td><p>아이디찾기</p></td>
                </tr>
            </div>

            <div>
                <tr class="user_nickName_Info">
                    <td>닉네임</td>
                    <td><input type="text" name="nickName" placeholder="8자리 이내로 입력하세요."></td>
                </tr>
            </div>

            <div>
                <tr class="user_email_Info">
                    <td >이메일</td>
                    <td><input type="email" name="Email" placeholder="이메일 형식에 맞춰 작성하세요."></td>
                </tr>
            </div>

            <div>
                <tr class="comm_1">
                    <td colspan="2">
                        <input type="submit" value="저장" class="check">
                        <input type="button" value="취소" class="cancel">
                    </td>
                </tr>
            </div> <!-- 아이디 찾기-->

            <div>
                <tr class="search_userPw">
                    <td><p>비밀번호 찾기</p></td>
                </tr>
            </div>

            <div>
                <tr class="user_id_Info">
                    <td>아이디</td>
                    <td><input type="text" name="user_Id"></td>
                </tr>
            </div>

            <div>
                <tr class="user_email_Info">
                    <td>이메일</td>
                    <td><input type="email" name="Email"></td>
                </tr>
            </div>

            <div>
                <tr class="user_check_no">
                    <td>인증번호</td>
                    <td><input type="text" name="check_no"></td>
                </tr>
            </div>

            <div>
                <tr class="comm_2">
                    <td colspan="2">
                        <input type="submit" value="저장" class="check">
                        <input type="button" value="취소" class="cancel">
                    </td>
                </tr>
            </div> <!-- 비밀번호 찾기-->
        </table> <!-- table-->
    </form>
   
    
</body>
</html>