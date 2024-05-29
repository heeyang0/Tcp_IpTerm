<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*" %>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
    <script type="text/javascript">
        function showConfirmation() {
            alert("����� �Ϸ�Ǿ����ϴ�.");
            window.location.href = "BlogList.jsp";
        }
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("euc-kr");

    String text = request.getParameter("_content");
    String hid = request.getParameter("_id");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/blog", "root", "1234");

        
        String query = "INSERT INTO list (text, id) VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, text);
        stmt.setString(2, hid);

        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            // Insertion successful
            out.println("<script type='text/javascript'>");
            out.println("showConfirmation();");
            out.println("</script>");
        } else {
            // Insertion failed
            out.println("<h2> ��� �� ������ �߻��߽��ϴ�. </h2>");
        }

        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<h2> ��� �� ������ �߻��߽��ϴ�. </h2>");
        out.println("<p>���� �޽���: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }
%>
</body>
</html>
