<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search Results</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>

    <body class="d-flex flex-column min-vh-100">
        <%String search = request.getParameter("title");%>
        
		<jsp:include page="./navbar.jsp"></jsp:include>
    
        <%
           try{
           Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication","root","");
           String sql = "select * from blogs where title = ?";
           PreparedStatement statement = c.prepareStatement(sql);
           statement.setString(1, search);
           ResultSet rs = statement.executeQuery();
           while(rs.next()){ 
           		String id = rs.getString(1);
        	   	String title = rs.getString(2);
           		String blog = rs.getString(3);
           		
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
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
           }}
           catch(Exception e){
               out.println(e);
           }
       %>
       <jsp:include page="./footer.jsp"></jsp:include>
    </body>
</html>