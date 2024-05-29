<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            margin: 20px;
            font-family: Roboto, sans-serif;
            font-size: 16px;
        }

        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #61CBC7;
            padding: 10px;
            height: 40px;
        	vertical-align: middle;
            font-size: 16px;
        }

        .tab a {
            float: left;
            display: block;
            color: black;
            text-align: center;
            padding: 10px 12px;
            text-decoration: none;
            font-size: 17px;
        }

        .tab a:hover {
            background-color: #45A9A9;
        }

        .welcome-message {
            float: right;
            padding: 5px 8px;
            font-size: 12px;
            color: dark-gray;
            height: 25px;
            width: 84px; 
        }

        .community-text {
            padding: 10px;
            background-color: #61CBC7;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="community-text">��� Ŀ�´�Ƽ</div>
    <div class="tab" id="header">
        <div class="welcome-message">
            <%
            HttpSession session2 = request.getSession(false);
            if (session2 != null && session2.getAttribute("_NICKNAME") != null) {
                String nickname = (String)session2.getAttribute("_NICKNAME");
                out.println("�ȴ�~ " + nickname + "");
            }
            %>
        </div>
        <a href="PostList.jsp" target="_View">��� �Խ���</a>
        <a href="BlogList.jsp" target="_View">���ڱ������</a>
        <a href="Chat.jsp" target="_View">��ȭ</a>
        <% 
        if (session2 == null || session2.getAttribute("_NICKNAME") == null) { %>
            <a href="#" onclick="showPopup(); return false;">�α���</a>
        <% } else { %>
            <a href="Logout.jsp">�α׾ƿ�</a>
        <% } %>
    </div>
    

    <script>
        function showPopup() {
            window.open("Login.jsp", "�α���", "width=400, height=450, top=10, left=10");
        }
    </script>
</body>
</html>
