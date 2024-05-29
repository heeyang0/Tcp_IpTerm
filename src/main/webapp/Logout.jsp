<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>로그아웃</title>
</head>
<body>
<%
	HttpSession session2 = request.getSession(false);
	if (session != null) {
	
	    session.invalidate();
	}
	
	response.sendRedirect("PostList.jsp");
%>
</body>
</html>