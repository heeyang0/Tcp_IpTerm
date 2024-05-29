<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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

        label {
            display: block;
            text-align: left;
            margin: 10px 0;
            color: #61CBC7;
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #61CBC7;
            box-sizing: border-box;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #61CBC7;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45A9A9;
        }
    </style>
</head>
<body>
    <h1>회원가입</h1>
    <form action="Join_Check.jsp" method="post">
        <input type="text" name="id" placeholder="아이디" required><p>

        <input type="password" name="pw" placeholder="비밀번호" required><p>

        <input type="text" name="name" placeholder="이름" required><p>

        <input type="text" name="nickname" placeholder="닉네임" required><p>

        <input type="submit" value="회원가입">
    </form>
</body>
</html>
