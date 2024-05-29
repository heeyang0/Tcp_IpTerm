<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*, java.io.*"%>
<%@ include file="Header.jsp" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="euc-kr">
    <title>글 작성 결과</title>
    <script type="text/javascript">
        function showConfirmation() {
            alert("등록이 완료되었습니다.");
            window.location.href = "PostList.jsp";
        }
    </script>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String title = request.getParameter("_title");
		String content = request.getParameter("_content");
		String nickname = request.getParameter("_nickname");
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection
					("jdbc:mysql://localhost/blog","root","1234"); 
			PreparedStatement stmt = conn.prepareStatement(
					"insert into post (title, content, nickname) values (?,?,? ) ");
			stmt.setString(1, title);
			stmt.setString(2,content);
			stmt.setString(3,nickname);
			stmt.executeUpdate();
			
			 out.println("<script type='text/javascript'>");
		        out.println("showConfirmation();");
		        out.println("</script>");
			
			
			stmt.close();
			conn.close();
		}catch(Exception e){
			
			e.printStackTrace();
		}
	
	%>
</body>
</html>