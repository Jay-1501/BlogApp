<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Updated</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <style>
            input[type="text"]::placeholder {
                text-align: center;
            }
            textarea::placeholder {
                text-align: center;
            }
        </style>

    </head>
    <body>
    	<% String blogid = request.getParameter("id"); %>
        <% String title = request.getParameter("title"); %>
        <% String blog = request.getParameter("blog");%>

        <jsp:include page="./navbar.jsp"></jsp:include>
        
        <%
        	try{
        		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/blogapplication", "root", "");
                String sql = "UPDATE blogs SET title=?, blog=?, timestamp=CURRENT_TIMESTAMP where blogs.id=?";
                PreparedStatement statement = c.prepareStatement(sql);
                statement.setString(1, title);
                statement.setString(2, blog);
                statement.setString(3, blogid);
                
                int val = statement.executeUpdate();
                
                if (val > 0) { %>
                <h1 class="users">
                    Blog has been updated
                </h1>
                <%
                 } else {
                     RequestDispatcher req = request.getRequestDispatcher("error.jsp");
                     req.forward(request, response);
                 }
                
        	} catch (Exception e){
        		System.out.println(e);
        	}
        %>
    </body>
</html>