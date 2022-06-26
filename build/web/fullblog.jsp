<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>;
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Welcome to Blog Application.</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	<link rel="stylesheet" href="style.css">
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="./navbar.jsp"></jsp:include>
	
	<% String blogid = request.getParameter("id"); %>
	
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");
	System.out.println(blogid);
	Statement ctmt = cn.createStatement();
	ResultSet rs = ctmt.executeQuery("SELECT * FROM blogs WHERE blogs.id='" + blogid + "'");
     
	rs.next();
	    
	int id = Integer.parseInt(rs.getString(1));
	String title = rs.getString(2);
	String blog = rs.getString(3);
	int user = Integer.parseInt(rs.getString(4));
	
	out.print("<div class='container mt-5' style='width: 1200px;'>");
	out.print("<div class='card'>");
	out.print("<h4 class='card-header'>" + title + "</h4>");
	out.print("<div class='card-body'>");
	out.print("<p class='card-text'>" + blog + "</p>");
	out.print("<a href='index.jsp' class='btn btn-outline-primary'>Back</a>");
	out.print("</div>");
	out.print("</div>");
	out.print("</div>");
	out.println("<br/>");
	
	%>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>