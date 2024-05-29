<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="euc-kr" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/blog", "root", "1234");
		
		PreparedStatement idCheck = conn.prepareStatement("select * from member where id=?");
		idCheck.setString(1, id);
		ResultSet rs = idCheck.executeQuery();
		
		if(rs.next()){
			//아이디가 존재하면
			response.sendRedirect("Join.jsp");
			out.println("<script>alert('아이디가 이미 존재합니다.');</script>");
		} else{
			PreparedStatement stmt = conn.prepareStatement(
					"insert into member (id, pw, name, nickname) values (?,?,?,?)");
			stmt.setString(1, id);
			stmt.setString(2, pw);
			stmt.setString(3, name);
			stmt.setString(4, nickname);
			stmt.executeUpdate();			
			
			response.sendRedirect("Login.jsp");
			out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
			
		}
		
		rs.close();
		idCheck.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>