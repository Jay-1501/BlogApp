<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
	<%
	
		session.invalidate();	
	
	     Cookie ck1 = new Cookie("email", "");
	     ck1.setMaxAge(0);
	     response.addCookie(ck1);
	     
	     Cookie ck2 = new Cookie("id", "");
	     ck2.setMaxAge(0);
	     response.addCookie(ck2);
	     
	     response.sendRedirect("index.jsp");
	%>
</body>
</html>