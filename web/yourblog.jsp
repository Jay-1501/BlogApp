<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>;
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Blogs</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="./navbar.jsp"></jsp:include>
	
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if (session.getAttribute("email") == null || session.getAttribute("id") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	
	<%! int userid=0; %>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");
	
	Cookie ck[] = request.getCookies();
	for(int i=0; i<ck.length; i++) {
		if(ck[i].getName().equals("id")) {
			userid = Integer.parseInt(ck[i].getValue());
			break;
		}
	}
	
	Statement ctmt = cn.createStatement();
	ResultSet rs = ctmt.executeQuery("SELECT * FROM blogs where created_by='"+ userid +"'");
	
	while(rs.next()){
		String id = (rs.getString(1));
		String title = rs.getString(2);
		String blog = rs.getString(3);
		int user = Integer.parseInt(rs.getString(4));
		
		String finalBlog = blog;
		
		if(blog.length() > 240){
			finalBlog = blog.substring(0, 300) + "  ....";
		}
		
		out.print("<div class='container mt-5' style='width: 1200px;'>");
		out.print("<div class='card'>");
		out.print("<h4 class='card-header'>" + title + "</h4>");
		out.print("<div class='card-body'>");
		out.print("<p class='card-text'>" + finalBlog + "</p>");
		out.print("<a href='fullblog.jsp?id=" + id + "' class='btn btn-outline-primary'>Read Full Article</a>");
		out.print("<div class='mt-2'></div>");
		out.print("<a href='updateBlog.jsp?id="+ id +"'><button type='button' class='btn btn-outline-success'>Update</button></a>");
		out.print("<a class='m-2' href='deleteBlog.jsp?id="+ id +"'><button type='button' class='btn btn-outline-danger'>Delete</button></a>");
		out.print("</div>");
		out.print("</div>");
		out.print("</div>");
		
	}
	%>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>