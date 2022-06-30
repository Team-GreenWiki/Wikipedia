<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wikipedia 우리 모두의 백과사전</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }

        /* body */
        body{
            background-color: #4b2b3010;
        }

        /* .container */
        .container{
            width: 1200px;
            height: auto;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
        }

        /* .main1 */
        .main1{
            margin-top: 300px;
            text-align: center;
        }

        .main1 .mainLogo img{
            width: 560px;
            height: 140px;
        }

        .main1 .input_search{
            width: 700px;
            height: 40px;
            line-height: 40px;
            border: none;
            border: 2px solid #4b2b30;
            border-radius: 20px;
            margin-top: 30px;
            font-size: 20px;
            text-indent: 15px;
        }

        /* .main2 */
        .main2{
            margin-top: 50px;
            display: flex;
            justify-content: space-around;
            display: none;
        }

        .main2 div{
            width: 45%;
            height: auto;
            padding: 10px;
            border: 1px solid #4b2b30;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <section class="main1">
            <a href="index.html" class="mainLogo"><h1><img src="../img/HatchfulExport-All/MainLogoMini.png"></h1></a>
            <input type="text" class="input_search" name="input_search">
        </section>

        <section class="main2">
            <div>
                <h2>What is Lorem Ipsum?</h2>
                <h3>Lorem Ipsum</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            </div>
            <div>
                <h2>Where does it come from?</h2>
                <h3>Lorem Ipsum</h3>
                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
            </div>
        </section>
    </div>
</body>
</html>