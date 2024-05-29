<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*, java.io.*" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>게시물 상세 보기</title>
   
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
            color: #333;
        }

        h2 {
            color: #61CBC7;
            text-align: center;
        }

        table {
            width: 50%;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 15px;
            text-align: left;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #61CBC7;
        }

        a:hover {
            text-decoration: none;
            color: #45A9A9;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("euc-kr");
    String title = request.getParameter("_title");
    String content = request.getParameter("_content");
    String nickname = request.getParameter("_nickname");
%>
<div class="container">
    <h2>깔깔깔깔</h2>
<% request.setCharacterEncoding("EUC-KR"); %>
    <table class="table">
        <tr>
            <td>제목:</td>
            <td><%=title %></td>
        </tr>
        <tr>
            <td>내용:</td>
            <td><%= content %></td>
        </tr>
        <tr>
            <td>닉네임:</td>
            <td><%= nickname %></td>
        </tr>
    </table>

    <a href="PostList.jsp" class="btn btn-primary">게시물 목록으로 돌아가기</a>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
