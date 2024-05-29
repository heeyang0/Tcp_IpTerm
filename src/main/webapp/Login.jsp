<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #61CBC7;
        }

        form {
            max-width: 300px;
            margin: 0 auto;
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"],
        input[type="button"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #61CBC7;
            box-sizing: border-box;
            border-radius: 4px;
        }

        input[type="submit"],
        input[type="button"] {
            background-color: #61CBC7;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45A9A9;
        }

     
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .popup h2 {
            color: #61CBC7;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 0;
        }
    </style>
    <script type="text/javascript">
        function handleLoginResult(success) {
            if (success) {
                // 로그인 성공 시 팝업 창 띄우기
                document.getElementById('popup').style.display = 'block';
                document.getElementById('overlay').style.display = 'block';
            } else {
                alert("아이디나 비밀번호가 틀립니다.");
                window.location.href = "Login.jsp";
            }
        }

        function closePopup() {
            // 팝업 닫기
            document.getElementById('popup').style.display = 'none';
            document.getElementById('overlay').style.display = 'none';
        }
    </script>
</head>
<body>
    <h1>로그인</h1>
    <form action="LoginCheckLogic.jsp" method="post">
        <input type="text" name="id" placeholder="아이디"><p>
        <input type="password" name="pw" placeholder="비밀번호"><p>
        <input type="submit" value="로그인">
        <input type="button" value="회원가입" onclick="location='Join.jsp';">
    </form>

    
    <div id="popup" class="popup">
        <h2>로그인 성공!</h2>
        <button onclick="closePopup()">닫기</button>
    </div>

 
    <div id="overlay" class="overlay"></div>
</body>
</html>
