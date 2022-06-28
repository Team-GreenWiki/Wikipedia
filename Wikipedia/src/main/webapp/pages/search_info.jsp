<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wikipedia �츮 ����� �������</title>
    <link rel="stylesheet" href="../search_Info.css" type="text/css">
    
</head>
<body>
    <div id="container">
        <div id="mainLogo">
            <a href="#"><h1><img src="../img/HatchfulExport-All/MainLogoMini.png"></h1></a>
        </div> <!-- #mainLogo -->

        <div id="text">
            <h1>���̵� / ��й�ȣ ã��</h1>
        </div> <!-- #text -->

        

        <form action="" name="search_Id" method="post" class="search_Id">

            <div id="search_yourId">
                <p>���̵� ã��</p>
            </div>
            
            <table>
                <div class="user_Id">
                    <tr>
                        <td class="Nick">�г���</td>
                        <td><label for="nickName">
                                <input type="text" name="nickName" class="input_nickName" placeholder="8�ڸ� �̳��� �Է��ϼ���.">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td class="Email">�̸���</td>
                        <td><label for="user_Email">
                                <input type="email" name="user_Email" class="input_Email" placeholder="�̸��� ���Ŀ� �����ּ���.">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="value">
                            <input type="submit" value="����" class="commit">
                            <input type="reset" value="���" class="cancel">
                        </td>
                    </tr>
                </div> <!-- #user_Id -->
            </table>
        </form> <!-- .search_Id-->

        

        <form action="" name="search_Pw" method="post" class="search_Pw">
            
            <div id="search_yourPw">
                <p>��й�ȣ ã��</p>
            </div>

            <table>
                <div class="user_Pw">
                    <tr>
                        <td>���̵�</td>
                        <td><label for="">
                                <input type="text" name="nickName" class="user_id" placeholder="8�ڸ� �̳��� �Է��ϼ���.">
                            </label>
                        </td>
                    </tr>
                </div>
                
                <div>
                    <tr>
                        <td>�̸���</td>
                        <td><label for="user_Email">
                                <input type="email" name="user_Email" class="user_email" placeholder="�̸��� ���Ŀ� �����ּ���.">
                            </label>
                        </td>
                    </tr>
                </div>

                <div>
                    <tr>
                        <td>������ȣ</td>
                        <td><label for="call_Num">
                                <input type="text" name="call_Num" class="user_num" placeholder="������ȣ�� �Է��ϼ���.">
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="value_2">
                            <input type="submit" value="����" class="comm">
                            <input type="reset" value="���" class="can">
                        </td>
                    </tr>
                </div>
            </table>
        </form> <!-- .search_Id-->
    </div> <!-- #container -->
</body>
</html>