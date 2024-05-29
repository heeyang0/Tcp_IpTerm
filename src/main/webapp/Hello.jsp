<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>발자국 남기기</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 40px;
            margin-top: 40px;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input {
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #61CBC7;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45A9A9; 
        }

        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #61CBC7; 
            margin-bottom: 20px;
        }

        .tab a {
            float: left;
            display: block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        .tab a:hover {
            background-color: #45A9A9;
        }

        .welcome-message {
            float: right;
            padding: 14px 16px;
            font-size: 14px;
            color: dark-gray;
        }
    </style>
</head>
<body>
<%@ include file="Header.jsp" %>

    <div class="container">
        <h2>발자국남기기</h2>
        <form action="HelloCheck.jsp" method="post">
            <div class="form-group">
                <label for="_id">작성자</label>
                <input type="text" name="_id" class="form-control" value="익명">
            </div>
            <div class="form-group">
                <label for="_content">내용</label>
                <input type="text" name="_content" class="form-control">
            </div>
            <input type="submit" value="밟기" class="btn btn-primary">
        </form>
    </div>

  
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function showPopup() {
            window.open("Login.jsp", "로그인", "width=400, height=450, top=10, left=10");
        }
    </script>
</body>
</html>
