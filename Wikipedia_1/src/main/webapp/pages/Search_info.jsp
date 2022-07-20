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

	<!-- 아이디 찾기 form -->
    <form name="search_info_ID" method="post" action="../process/Search_Info_Process_ID.jsp">
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
                    	<input type="submit" value="저장" class="check" onclick= "validateForm_1(this.form);">
                        <!-- <input type="button" value="저장" class="check" onclick= "validateForm_1(this.form);"> -->
                        <input type="button" value="취소" class="cancel">
                    </td>
                </tr>
            </div> <!-- 아이디 찾기-->
         </table>  
	</form>
	
	<!-- 비밀번호 찾기 form -->
	<form name="search_info_PW" method="post" action="../process/Search_Info_Process_PW.jsp">
		<table>
            <div>
                <tr class="search_userPw">
                    <td><p>비밀번호 찾기</p></td>
                </tr>
            </div>

            <div>
                <tr class="user_id_Info">
                    <td>아이디</td>
                    <td><input type="text" name="user_Id" placeholder="아이디를 입력하세요."></td>
                </tr>
            </div>

            <div>
                <tr class="user_email_Info">
                    <td>이메일</td>
                    <td><input type="email" name="email" placeholder="이메일 형식에 맞춰 작성하세요."></td>
                </tr>
            </div>

            <!-- <div>
                <tr class="user_check_no">
                    <td>인증번호</td>
                    <td><input type="text" name="check_no"></td>
                </tr>
            </div> -->

            <div>
                <tr class="comm_2">
                    <td colspan="2">
                        <input type="submit" value="저장" class="check" onclick="validateForm_2(this.form);">
                        <input type="button" value="취소" class="cancel">
                    </td>
                </tr>
            </div> <!-- 비밀번호 찾기-->
        </table> <!-- table-->
    </form>
    
   
   <!-- 스크립트 -->
   <script type="text/javascript">
      		
   		function validateForm_1(form) {
   			
   			if (form.nickName.value == "") {
   				alert("닉네임을 입력하세요.");
   				form.nickName.focus();
   				return false;
   			}
   			
   			if (form.Email.value == "") {
   				alert("이메일을 입력하세요.");
   				form.email.focus();
   				return false;
   			}	
   		}
   		
   		
   		function validateForm_2(form) {
   			
   			if (form.user_Id.value == "") {
   				alert("아이디를 입력하세요.");
   				form.user_Id.focus();
   				return false;
   			}
   			
   			if (form.email.value == "") {
   				alert("이메일을 입력하세요.");
   				form.email.focus();
   				return false;
   			}
   		}
   </script>
    
</body>
</html>