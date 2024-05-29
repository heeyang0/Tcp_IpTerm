<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

<%
    boolean loginSuccess = false;

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/blog", "root", "1234");

        // Prepare a statement with parameters to prevent SQL injection
        String sql = "SELECT * FROM member WHERE id=?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("pw");

                if (pw.equals(storedPassword)) {
                    // Passwords match, set session attributes
                    String nickname = rs.getString("nickname");

                    session.setAttribute("_ID", id);
                    session.setAttribute("_NICKNAME", nickname);
                    loginSuccess = true;
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<script type="text/javascript">
    <% if (loginSuccess) { %>
        alert("�α��� ����!");
  
        window.opener.location.href = "PostList.jsp";
     
        window.close();
    <% } else { %>
        alert("���̵� ��й�ȣ�� Ʋ���ϴ�.");
        window.location.href = "Login.jsp";
    <% } %>
</script>
