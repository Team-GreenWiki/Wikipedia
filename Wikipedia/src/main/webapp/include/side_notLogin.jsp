<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
     *{
      margin: 0;
      padding: 0;
      position:relative;
    }
    .side_whole{
      position:absolute;
      top:30%;
      left:5%;
      width: 300px;
      height: 700px;
      border: 2px solid #4b2b30;
      border-radius: 15px;
      background-color: #884e56;
    }
    .side_above{
      margin-top: 50px;
      font-size: larger;
      margin-bottom: 80px;
    }
    .side_above>h4{
      font-size: larger;
      text-align: center;
      color: #fff;
    }
    .side_above>a{
      display: block;
      font-size: small;
      text-align: center;
      text-decoration: none;
      color: #fff;
    }
    .side_middle{
      display: block;
    }
    .side_middle>a{
      font-size: larger;
      display: block;
      text-align: center;
      margin-bottom: 50px;
      text-decoration: none;
      color: #fff;
    }
  </style>
</head>
<body>

   <!-- �α��� �ϱ� �� ���̵� �޴� -->
  <div> 
    <div class="side_whole">
    <div class="side_above">

      <h4>�α��� �ϼ���</h4>
    </div>

    <!-- 
      ���Ŀ� ������ ������ �ϼ��� href�� ��� ������ ��.
    -->
	    <div class="side_middle">
	      <a href="">���� ����</a>
	      <a href="">����</a>
	      <a href="">������ ������</a>
	      <a href="./login.html">���� �� ��</a>
	      <a href="./login.html">���� �� ���</a>
	    </div>
	  </div>
 </div>
    
</body>
</html>