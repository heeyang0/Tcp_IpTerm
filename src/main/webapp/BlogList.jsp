<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>발자국 남기기</title>
    <style>
        body {
            background-color: #f5f5f5;
            color: #333;
            margin: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        a {
            padding: 10px 20px;
            margin-bottom: 20px;
            background-color: #61CBC7;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            display: inline-block;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            margin-bottom: 5px; 
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            font-size: 15px;
            background-color: #f5f5f5;
        }
         th {
         padding: 10px;
        border: 1px solid #ddd;
        background-color: #61CBC7;
        color: white;
        text-align: center;
    }
        td{
        background-color : white;
        }
        .button-container {
            text-align: right;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h2>발자국남기기</h2>
    <div class="button-container">
        <a href="Hello.jsp">흔적남기기</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>순번</th>
                <th>내용</th>
                <th>작성자</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                request.setCharacterEncoding("euc-kr");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/blog", "root", "1234");
                PreparedStatement stmt = conn.prepareStatement("select * from list");
                ResultSet rs = stmt.executeQuery();
                int count = 1;
                while (rs.next()) {
                    String content = rs.getString("text");
                    String hid = rs.getString("id");

                    out.println("<tr>");
                    out.println("<td>" + count++ + "</td>");
                    out.println("<td>" + content + "</td>");
                    out.println("<td>" + hid + "</td>");
                    out.println("</tr>");
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
</body>
</html>
