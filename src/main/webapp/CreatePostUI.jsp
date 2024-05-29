<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ include file="Header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>깔깔 게시판</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
            margin: 20px;
            padding: 0;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #61CBC7;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
            color: #333; 
        }

        input[type="text"]:focus, textarea:focus {
            border-color: #61CBC7; 
        }

        input[type="submit"] {
            background-color: #61CBC7;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45A9A9;
        }
    </style> 
    <script type="text/javascript">
        function validateForm() {
            var title = document.forms["postForm"]["_title"].value;
            var content = document.forms["postForm"]["_content"].value;

            if (title.trim().length < 3) {
                alert("제목을 3자 이상 입력해주세요.");
                return false;
            } else if (content.trim().length < 10) {
                alert("내용을 10자 이상 입력해주세요.");
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>
<body>      <form method="post" action="CreatePost.jsp" >
        <table border: 1px solid #dddddd">
                <tr>
                    <th>깔깔깔깔</th>
                </tr>
                <tr>
                    <td>제목 : <input type="text" name ="_title" maxlength="50"></td>
                </tr>
                <tr>
                	
                    <td>내용  <br><textarea  maxlength="2048" name = "_content"></textarea></td>
                </tr>
            <input type="hidden" name="_nickname" value="<%= session.getAttribute("_NICKNAME") %>">
        </table>
        <input type="submit" value="아이 재밌어!">
    </form>
</body>
</html>