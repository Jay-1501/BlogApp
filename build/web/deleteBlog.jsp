<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Deleted</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

		<jsp:include page="./navbar.jsp"></jsp:include>
		
		<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			if (session.getAttribute("email") == null || session.getAttribute("id") == null) {
				response.sendRedirect("login.jsp");
			}
		%>
		
		<%
			String blogid = request.getParameter("id");
			try{
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");
                String sql = "Delete from blogs WHERE blogs.id=?";
                PreparedStatement statement = c.prepareStatement(sql);
                statement.setString(1, blogid);
                int val = statement.executeUpdate();
                if (val > 0) { %>
			        <h1 class="users">
			            Blog has been deleted
			        </h1>
			        <%
	            } else {
	                RequestDispatcher req = request.getRequestDispatcher("error.jsp");
	                req.forward(request, response);
	            }
			} catch(Exception e){
				System.out.print(e);
			}
		%>
    </body>
</html>