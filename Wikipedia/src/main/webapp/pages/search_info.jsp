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
         * {
            margin: 0 auto;
            padding: 0;
            box-sizing: border-box;
        }

        /* 메인로고 */
        .mainLogo {
            width: 400px;
            height: 120px;
            margin-top: 50px;
            margin-left: 40%;
        }

        /* 아이디 / 비밀번호 찾기 */
        #text {
            padding: 50px;
            text-align: center;
        }

        /* 아이디 찾기 */
        .search_userId {
            display: block;
            font-size: 25px;
            font-weight: bold;
            padding-bottom: 30px;
        }

        /* 아이디찾기 - 닉네임 */
        .user_nickName_Info {
            font-size: 20px;
            font-weight: bold;
        }

        /* 아이디 찾기 - 닉네임 text */
        .user_nickName_Info input {
            height: 40px;
            width: 200px;
            border : 2px solid rgb(70, 44, 48);
            border-radius: 25px;
            margin-bottom: 10px;
        }

        /* 아이디 찾기 - 이메일 */
        .user_email_Info {
            font-size: 20px;
            font-weight: bold;
        }
        
        /* 아이디 찾기 - 이메일 */
        .user_email_Info input {
            height: 40px;
            width: 200px;
            border : 2px solid rgb(70, 44, 48);
            border-radius: 25px;
        }
        
        /* 아이디 찾기 - 저장 / 취소 */
        .check {
            height: 40px;
            width: 70px;
            margin-left: 180px;
            margin-top: 20px;
        }

        /* 아이디 찾기 - 저장 / 취소 */
        .cancel {
            height: 40px;
            width: 70px;
            margin-top: 20px;
        }
    

        /* 비밀번호 찾기 */
        .search_userPw {
            display: block;
            font-size: 25px;
            font-weight: bold;
            padding-bottom: 30px;
            padding-top: 50px;
        }

        /* 비밀번호 찾기 - 아이디 */
        .user_id_Info {
            font-size: 20px;
            font-weight: bold;
        }

        /* 비밀번호 찾기 - 아이디 */
        .user_id_Info input {
            height: 40px;
            width: 200px;
            border : 2px solid rgb(70, 44, 48);
            border-radius: 25px;
            margin-bottom: 10px;
        }


        /* 비밀번호 찾기 - 인증번호 */
        .user_check_no {
            font-size: 20px;
            font-weight: bold;
        }

        /* 비밀번호 찾기 - 인증번호 */
        .user_check_no input {
            height: 40px;
            width: 200px;
            border : 2px solid rgb(70, 44, 48);
            border-radius: 25px;
            margin-bottom: 10px;
            margin-top: 10px;
        }

        /* 비밀번호 찾기 - 저장 / 취소 */

    </style>
</head>
<body>
    
        <a href="#"><img src="../img/HatchfulExport-All/MainLogoMini.png" class="mainLogo"></a>

    <div id="text">
        <h1>아이디 / 비밀번호 찾기</h1>
    </div>

    <form action="" name="search_Info" method="post">
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